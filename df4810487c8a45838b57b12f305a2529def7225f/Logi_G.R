# Logistic growth

grow <- function (growth.rate, num_gen) {
  N <- rep (0,num_gen)
  generation=rep(0,num_gen)
  generation[1]=1
  N[1] <- 10
  for (i in 2:num_gen) {
    N[i]= N[i-1]+(growth.rate * N[i-1] * ((100-
                                             N[i-1])/100))
    generation [i]=i
  }
  plot(N~generation, type='b')
}
grow (0.1,50)
grow (0.5,50)
grow (1.3,50)
grow (2.52,50)
grow (3,50)

saveGIF({
  for (i in 1:length(seq(0.1,3, 0.1))){
    a<-seq(0.1,3, 0.1)[i]
    grow(a,50)
  }
}, interval = 0.3, ani.width = 950, ani.height = 550)
