a <- data.frame(
  a1 = c(2,4,6),
  a2 = c(3,5,8),
  a3 = c(4,1,9)
)
head(a)

?pmin
pmin(a$a1,a$a2,a$a3)
min(a$a1,a$a2,a$a3)

pmin_apply<-function(...){
  apply(..., 1, min)
  }
pmin_apply(a)

pmin_for <- function(...) {
  result <- numeric(nrow(...))
  for (i in 1:nrow(...)) {
    result[i] <- min(as.numeric(...[i, ]))
  }
  
  return(result)
}
pmin_for(a)

install.packages("bench")
bench::mark(base=pmin(a$a1,a$a2,a$a3),
            pmin_apply=pmin_apply(a),
            pmin_for=pmin_for(a)
)
