# Devanney SNT function

H<-function(d,dmid=180,s=2.18,g=0.02) {
  cinf=1
  c0=0
  cinf+(c0-cinf)/((1+ (d/dmid)^s)^g)
}
d<-c(5,20,40,60,80,125,150,175,200,250,300,500,750,1000,1250)
print(plot(d,H(d)))