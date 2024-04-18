print.testresult <- function(model,X2,df.v,by.var) {
  p.values = pchisq(X2,df.v,lower.tail=FALSE) 
  if(by.var){
    var.names = unlist(strsplit(as.character(formula(model))[3],split=" \\+ "))
  }else{
    var.names = names(coef(model))
  }
  # longest name
  longest.char = max(nchar(var.names))
  cat(paste0(rep("-",28+longest.char),collapse = ""),"\n")
  cat(paste0("Test for",paste0(rep(" ", longest.char-6), collapse = ""), "X2\tdf\tprobability"),"\n")
  cat(paste0(rep("-",28+longest.char),collapse = ""),"\n")
  cat(paste0("Omnibus",paste0(rep(" ", longest.char-5), collapse = ""), round(X2[1],digits=2),"\t",df.v[1],"\t",round(p.values[1],digits=2)))
  cat("\n")
  for(i in 1:length(var.names)){
    name = var.names[i]
    cat(paste0(name,paste0(rep(" ", longest.char-nchar(name)+2), collapse = ""), round(X2[i+1],digits=2),"\t",df.v[i+1],"\t",round(p.values[i+1],digits=2),"\n"))
  }
  cat(paste0(rep("-",28+longest.char),collapse = ""),"\n\n")
  cat("H0: Parallel Regression Assumption holds\n")
  result.matrix = matrix(c(X2, df.v, p.values), ncol = 3)
  rownames(result.matrix) = c("Omnibus", var.names)
  colnames(result.matrix) = c("X2","df","probability")
  result.matrix
}
