---
title:
author: 
tags:
---

A simplified OM-building set of scripts for a grid of SS3 runs.


# FILES (in order of usage)

- boot.R, install packages from github
- data.R, loads results of base case SS3 runs, just for comparison.
- model_grid.R, prepares and runs model grid, depends on stock-specific grid function.
  - model/grid.Rdata: grid data.table.
- model_load.R, loads output from model runs and retros.
  - model/load.Rdata: full (list w/ stock, sr, refpts, results, output)
- model_rate.R, run diagnostics to select and weight runs.
  - model/rate.Rdata: updated results data.table.
- model-subset.R, subset based on acceptance criteria and resamples based on DM p-value.
  - model/full.Rdata: stock, sr, refpts, results, indices
- output.R, creates OM and OEM, recomputes index.q, constructs deviances
  - output/om.RData: om, oem, results, deviances

# OTHER FILES (to be included)

- report.R, plots from all steps.
- test.R, tests of individua, steps.
