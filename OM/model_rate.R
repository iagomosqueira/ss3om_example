# model_full_metrics.R - DESC
# /model_full_metrics.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2

library(r4ss)
library(ss3diags)
library(ss3om)

library(FLasher)

library(doParallel)
registerDoParallel(2)

# --- DIAGNOSTICS & METRICS

load("model/load.Rdata")

results <- full$results
srr <- full$sr

# ADD CPUE label (index)
results[, index:=ifelse(cpues == 12, "LLCPUE1", "LLCPUE3")]


# 1. FIND unrealistic values (SSB_Virgin > 1e7 t, SSB_status > 3, F_2017 > 1)

results[, del1:=SSB_Virgin > 4e5 | SSB_status > 3 | F_endyr > 1]
sum(results[(del1),del1])


# 2. CHECK convergence < 1e-4

results[, del2:=Convergence_Level > 1e-4]
sum(results[(del2),del2])


# 3. COMPUTE retrospective Mohn's rho

mrhos <- lapply(retros, SSmohnsrho, startyr=2013, verbose=FALSE)

results[, mrho:=unlist(lapply(mrhos, '[[', 'AFSC_Hurtado_SSB'))]


# 4. COMPUTE measure of process error

results[, Recr_sigma := c(sqrt(yearVars(residuals(srr)[, ac(1975:2015)])))]


# 5. COMPUTE hcxval prediction skill: MASE of model CPUE, S1 & S4.

library(forecast)

ssmases <- rbindlist(foreach(x=seq(retros)) %dopar% {

  # EXTRACT residuals: S 1,4, CPUE 1,3
  res <- rbindlist(lapply(c(1,4), function(s) SSmase(retros[[x]], Season=s,
    residuals=TRUE)$Residuals))[Index %in% paste0("LLCPUE", c(1,3))]

  # CALCULATE MASE
  mase <- sum(abs(res$Pred.Res)) / sum(abs(res$Naive.Res))

  # GET p-value
  pvalue <- unname(dm.test(res$Pred.Res, res$Naive.Res, alternative="greater")$p.value)

  data.table(mase=mase, pvalue=pvalue)
  }
)

results[, c("mase","pvalue") := ssmases]

# ID runs with mase(LLCPUE1/3_S01/04) > 1

results[, del3 := mase > 1]
sum(results[(del3),del3])


# 7. NC 2018-2019

nc <- c(`2018`=41615, `2019`=39426)

# EXTEND yearly stock, using avreage of last 3 years for biology and selex
stk <- stf(noseason(full$stock), end=2019)

range(stk, c("minfbar", "maxfbar")) <- c(1,12)

# PROJECT for NC plus 2x limit in yearly increase in F

fctrl <- fwdControl(list(year=2018:2019, quant="catch", value=nc),
    list(year=2018:2019, quant="fbar", relYear=2017:2018, min=0, max=2))

fut <- fwd(stk, sr=srr, control=fctrl)


# IDENTIFY runs where C2018-19 < NC * 0.99

del4 <- c(unitSums(catch(fut)[, '2018']) < nc['2018'] * 0.99) |
  c(unitSums(catch(fut)[, '2019']) < nc['2019'] * 0.99)

results[, del4 := del4]
sum(results[(del4), del4])

# 9. ADD iters selection

results[, sel:=!(del1 | del2 | del3 | del4)]
sum(results[(sel),sel])

save(results, file="model/rate.Rdata")
