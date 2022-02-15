# test.R - DESC
# /test.R

# Copyright Iago MOSQUEIRA (WMR), 2022
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)


# TEST harvest / fbar {{{

ref <- Reduce(combine, lapply(full$output, extractFbar))

com <- unitMeans(seasonSums(fbar(full$stock)))

sim <- fbar(noseason(full$stock))

plot(ref, com, sim)

# CHECK noseason

st <- full$stock
xt <- noseason(full$stock)

# n as season 1 OK
stock.n(xt) / stock.n(st)[,,,1]


zs <- Reduce(combine, 
  lapply(full$output, function(x)
    ss3z30(data.table(x$Z_at_age), dimnames(xt)[1:5]))
  )

harvest(xt) <- zs - m(xt)


quantMeans(zs[2:13,])


# }}}
