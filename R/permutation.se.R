permutation.se<-function(x,y,bags,mtry,perms){
  neighbor<-neighbor.structure(x,bags,mtry)
  se<-vector(mode="numeric",length=perms)
  for(j in 1:perms){
    y<-sample(y,replace=F)
    h=s=vector(mode="numeric",length=length(y))
    for(i in 1:length(x)){
      h[i]<-sum(y[neighbor[i,]])/bags
      s[i]<-(h[i]-y[i])^2
    }
  se[j]<-sum(s)
  }
  return(se)
}
permutation.se<-compiler::cmpfun(permutation.se)

