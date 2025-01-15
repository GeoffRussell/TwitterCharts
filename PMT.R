#  Google sheets PMT function
PMT<-function(annualRate,nMonths,PV) {
  pr<-annualRate/100/12           
  (pr%*%t(PV))/(1 - (1+pr)^(-nMonths))
}
#PMT(c(6),15*12,c(78e6))
#PMT(c(6),15*12,c(112e6))
#PMT(c(8),15*12,c(78e6))
#PMT(c(8),15*12,c(112e6))
cat("PMT(c(6,7,8,9),15*12,c(78e6,112e6))")
