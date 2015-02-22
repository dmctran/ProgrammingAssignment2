## cacheSolve
### Description
Together with **makeCacheMatrix**, this function extends the **solve** function, 
and caches the result.
In this assignment, this function calculates the inverse of a matrix and
caches the calculated inverse.

### Arguments
*x* - the closure returned by calling makeCacheMatrix

*...* - pass on to the **solve** function

### Usage
cm <- makeCacheMatrix(m)

cacheSolve(cm)

### Examples/Testing
x1 <- matrix(1:4, nrow = 2, ncol = 2)

x2 <- matrix(1:4, nrow = 2, ncol = 2)

x1i <- solve(x1)

mx1 <- makeCacheMatrix(x1)

mx1i1 <- cacheSolve(mx1)

mx1i2 <- cacheSolve(mx1) ## *cache copy returned here*

mx1$set(x2)

mx1i3 <- cacheSolve(mx1) ## *cache copy returned here*

x3 <- matrix(2:5, nrow = 2, ncol = 2)

mx1$set(x3)

mx1i4 <- cacheSolve(mx1) ## *new calculation here*

identical(x1i, mx1i1) ## *TRUE*

identical(x1i, mx1i2) ## *TRUE*

identical(x1i, mx1i3) ## *TRUE*

identical(x1i, mx1i4) ## *FALSE*
