neighbor.structure<-function(x,bags,mtry){
  neighbor<-matrix(0,nrow=length(x),ncol=bags)
  for(i in 1:length(x)){
    for(n in 1:bags){
      l<- 1:length(x)
      nearest<- sample(l[-i],1)
      for(j in 1:(mtry-1)){
      k<-sample(l[-i],1)
      if(abs(x[k]-x[i])<abs(x[nearest]-x[i])) nearest=k
      }
      neighbor[i,n]<-nearest
    }
  }
  return(neighbor)
}
neighbor.structure<-compiler::cmpfun(neighbor.structure)


