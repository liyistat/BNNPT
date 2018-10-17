observed.se<-function(x,y,bags,mtry){
  neighbor<-neighbor.structure(x,bags,mtry)
  s<-function(i){return((sum(y[neighbor[i,]])/bags - y[i])^2)}
  temp <- lapply(1:length(x), function(i) s(i))
  se<-sum(unlist(temp))
  return(se)
}
observed.se<-compiler::cmpfun(observed.se)

