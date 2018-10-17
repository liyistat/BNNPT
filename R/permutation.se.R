permutation.se<-function(x, y, bags, mtry, perms){
  neighbor<-neighbor.structure(x, bags, mtry)
  se<-function(j){
    y<-sample(y,replace=F)
    s<-function(i){return((sum(y[neighbor[i,]])/bags - y[i])^2)}
    temp <- lapply(1:length(x), function(i) s(i))
    se <- sum(unlist(temp))
    return(se)
  }
  result <- unlist(lapply(1:perms, function(j) se(j)))
  return(result)
}
permutation.se<-compiler::cmpfun(permutation.se)


