observed.se<-function(x,y,bags,mtry){
  neighbor<-neighbor.structure(x,bags,mtry)
  h=s=vector(mode="numeric",length=length(y))
  for(i in 1:length(x)){
    h[i]<-sum(y[neighbor[i,]])/bags
    s[i]<-(h[i]-y[i])^2
  }
  se<-sum(s)
  return(se)
}
observed.se<-compiler::cmpfun(observed.se)
