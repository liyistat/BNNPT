#'BNNPT (Bagging Nearest-Neighbor Prediction independence Test)
#'
#'Bagging Nearest-Neighbor Prediction independence Test: an efficient method for nonlinear dependence of two continuous variables.
#'Testing dependence/correlation of two variables is one of the fundamental tasks in statistics. In this work, we proposed an efficient method for nonlinear dependence of two continuous variables (X and Y).
#'We addressed this research question by using BNNPT (Bagging Nearest-Neighbor Prediction independence Test).
#'In the BNNPT framework, we first used the value of X to construct a bagging neighborhood structure. We then obtained the out of bag estimator of Y based on the bagging neighborhood structure.
#'The square error was calculated to measure how well Y is predicted by X. Finally, a permutation test was applied to determine the significance of the observed square error.
#' @author Yi Li, \email{liyistat@@gmail.com}
#' @param x A vector containing values of a continuous variable (X).
#' @param y A vector containing values of a continuous variable (Y).
#' @param bags the number of bagging.
#' @param mtry the number of randomly selected values from X.
#' @param perms the number of permutations to calculate permutation pvalues.
#' @return pvalue The pvalue of BNNPT.
#' @export
#' @references Wang, Yi, Yi Li, Xiaoyu Liu, Weilin Pu, Xiaofeng Wang, Jiucun Wang, Momiao Xiong, Yin Yao Shugart, and Li Jin. "Bagging Nearest-Neighbor Prediction independence Test: an efficient method for nonlinear dependence of two continuous variables." Scientific reports 7, no. 1 (2017): 12736.
#' @examples
#'
#' #Example1
#' set.seed(1234)
#' x<-rnorm(1000)
#' y<-rnorm(1000)
#' #Test whether X and Y are independent or not using BNNPT
#' library(BNNPT)
#' #Set the default parameters: bags= 20, mtry = 10, perms = 100
#' t1<- Sys.time()
#' bnnpt(x,y,bags = 20, mtry = 10, perms = 100)
#' t2<- Sys.time()
#' #Output calculation time of BNNPT
#' t2-t1
#'
#' #Example2
#' #Generate random variables X and Y with sin function
#' set.seed(1234)
#' x<-rnorm(1000)
#' y<-sin(x)
#' #Test whether X and Y are independent or not using BNNPT
#' library(BNNPT)
#' t1<- Sys.time()
#' #Set the parameters: bags= 256, mtry = floor(sqrt(length(x))), perms = 100
#' bnnpt(x, y, bags = 256, mtry = floor(sqrt(length(x))), perm = 100)
#' t2<- Sys.time()
#' #Output calculation time of BNNPT
#' t2-t1
#'
bnnpt <- function(x, y, bags=256, mtry=floor(sqrt(length(x))), perms=100) {
  stopifnot((bags>0)&(mtry>0)&(perms>0))
  observed<-observed.se(x,y,bags,mtry)
  permutations<-permutation.se(x,y,bags,mtry,perms)
  count<-length(which(permutations<=observed))
  pvalue<-count/perms
  names(pvalue)<-c("BNNPT's pvalue")
  return(pvalue)
}
bnnpt<-compiler::cmpfun(bnnpt)


