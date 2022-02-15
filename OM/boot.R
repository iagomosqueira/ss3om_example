# boot.R - Setup system
# ALB/OM/boot.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(remotes)

# INSTALL latest versions from github

install_github(c("flr/FLCore", "flr/ggplotFL", "flr/FLFisheries", "flr/FLasher",
    "flr/ss3om", "flr/mse", "r4ss/r4ss"))

# ss3diags

install_github(c("iagomosqueira/ss3diags"))

# CRAN

install.packages(c("forecast", "doParallel"))

