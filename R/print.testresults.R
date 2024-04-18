print.testresult <- function(model,X2,df.v,by.var) {
  p.values = pchisq(X2,df.v,lower.tail=FALSE) 
  if(by.var){
    var.names = unlist(strsplit(as.character(formula(model))[3],split=" \\+ "))
  }else{
    var.names = names(coef(model))
  }
  # longest name
  longest.char = max(nchar(var.names))
  cat(spaces(28+longest.char, "-"),"\n")
  cat(paste0("Test for",spaces(longest.char-6), "X2",spaces(6),"df",spaces(6),"probability"),"\n")
  cat(spaces(28+longest.char, "-"),"\n")
  cat(paste0("Omnibus",spaces(longest.char-5), round(X2[1],digits=2),spaces(8-nchar(round(X2[1],digits=2))),df.v[1],spaces(8-nchar(df.v[1])),round(p.values[1],digits=2)))
  cat("\n")
  for(i in 1:length(var.names)){
    name = var.names[i]
    cat(paste0(name, spaces(longest.char-nchar(name)+2), round(X2[i+1],digits=2),spaces(8-nchar(round(X2[i+1],digits=2))),df.v[i+1],spaces(8-nchar(df.v[i+1])),round(p.values[i+1],digits=2),"\n"))
  }
  cat(spaces(28+longest.char, "-"),"\n\n")
  cat("H0: Parallel Regression Assumption holds\n")
  result.matrix = matrix(c(X2, df.v, p.values), ncol = 3)
  rownames(result.matrix) = c("Omnibus", var.names)
  colnames(result.matrix) = c("X2","df","probability")
  result.matrix
}

spaces = function(n, sign = " "){
  paste0(rep(sign, n), collapse = "")
}
