#Author: Abhinav Agarwal, aagarwal DOT gtr AT gmail DOT com
#Easy Task: install minval from CRAN
if(!require(minval)) {
  install.packages("minval")
  library(minval)
}

#load dataset glugln
data(glugln)

#Medium Task: unbalancedReactions contains all mass unbalanced reactions in glugln
#subset the dataset by checking if each reaction is mass unbalanced
unbalancedReactions <- subset(glugln, unbalanced(glugln) == TRUE)

#Hard Task: function to calculate formal charge of a compound
#CHNOSZ for its 'makeup' function
if(!require(CHNOSZ)) {
  install.packages("CHNOSZ")
  library(CHNOSZ)
}

#function to calculate formal charge of a compound
#incomplete because cannot calculate without knowing lewis structure
formalCharge <- function(metabolite) {
  formula <- chebi.formula(metabolite) #conver named compound to its formula
  makeup <- as.data.frame(t(makeup(formula))) #convert makeup split of compound to data frame
  if(!is.null(makeup$Z)) return(makeup$Z) #if compound has overall charge return
  
  return(charge)
}
formalCharge("ATP")

#function to calculate formal charge assuming number of valence electrons, non bonding electrons, bonding electrons
#for a atomic species in a compound
formalCharge1 <- function(v, nb, b) {
  charge <- v - nb - (b/2)
  return(charge)
}
formalCharge1(5, 2, 3)
