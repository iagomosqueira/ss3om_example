# model_full_grid.R - SETUPS the full grid of SS3 runs
# ALB/OM/model_full_grid.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)

source("utilities.R")

library(doParallel)
registerDoParallel(3)

# DEFINE full grid

full <- list(
  M = seq(0.20, 0.35, length = 4),
  sigmaR = seq(0.4, 0.8, length = 3),
  steepness = seq(0.7, 0.9, length = 3),
  cpues = c(14, 12),
  lfreq = c(1e-2, 0.1, 1),
  llq = c(1, 1.01)
)

fullgrid <- expand.grid(full, stringsAsFactors = FALSE)

# MAKE small grid for demonstration

smallgrid <- fullgrid[1:8,]


# --- SETUP

grid <- setioalbgrid(smallgrid, dir = "model",
  base = "data/PSLFwt/CPUE_SouthWest", name = "abt", write=TRUE)

lapply(file.path("model", grid$id), prepareRetro)

save(grid, file="model/grid.Rdata")

# COMMAND to run using GNU parallel

# ls | parallel -j44 --bar --progress '(cd {}; ss_3.30.16 && packss3run; cd retro; for d in ./*/ ; do (cd "$d" && ss_3.30.16 && packss3run); done)'
