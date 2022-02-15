# model_full_subset.R - DESC
# ALB/OM/model_full_subset.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(FLCore)

load("model/load.Rdata")
load("model/rate.Rdata")

# --- SUBSET

# INDEX for subsetting
sel <- results$sel

# SUBSET results, sr and refpts

results <- results[(sel),]
sr <- iter(full$sr, sel)
refpts <- full$refpts[, sel]

# GENERATE subset 2 SEX yearly stock

stock <- stf(noseason(iter(full$stock, sel)), end=2040)

# SUBSET indices: index. index.q (index.var), unit=1, seasons 1-4
indices <- FLIndices(full$indices[c("LLCPUE1", "LLCPUE3")])

indices <- lapply(indices, function(x) {
  FLIndexBiomass(index=index(x)[,,,1,,sel], index.var=index.var(x)[,,,1,,sel],
    sel.pattern=unitMeans(sel.pattern(x)[,,,1,,sel]), index.q=index.q(x)[,,,1,,sel],
    range=c(startf=0, endf=0.25, min=1, max=12))
  })

# DEBUG FIX dimnames$unit
dimnames(indices[[1]]) <- list(season='all')
dimnames(indices[[2]]) <- list(season='all')

save(stock, sr, refpts, results, indices, file="model/full.Rdata",
  compress="xz")
