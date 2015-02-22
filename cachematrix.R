## This function provides the ability to cache objects (in this assignment, 
## the matrix itself and its inverse).
makeCacheMatrix <- function(x = matrix()) {
    # Free variable to store (cache copy) the inverse of a matrix
    # initialised with NULL
    xInverse <- NULL
    
    # Provide the ability to "reset" a matrix.
    # If a new matrix is given, the cached inverse matrix is also cleared/reset
    set <- function(y) {
        # check to make sure if the "new" matrix (y) is the same as the
        # original matrix (x).  If the "new" matrix is different, clear
        # the cached inverse matrix
        if (!identical(x,y)) {
            x <<- y
            xInverse <<- NULL
        }
    }    
    
    # Returns the (underlying) matrix
    get <- function() x
    
    # Store/cache the given object (xi - and in this assignment, the calculated 
    # inverse of a matrix)
    setInverse <- function(xi) xInverse <<- xi
    
    # Return the cache object (in this assignment, the inverse of a matrix)
    getInverse <- function() xInverse
    
    # A technique used to group related functions (Lists of functions)
    # A function can be invoked by first extract it and then call it.
    list(get = get,
         set = set,
         getInverse = getInverse,
         setInverse = setInverse)
}

## This function calculates the inverse of a matrix.  If the given matrix (x) 
## already had its inverse calculated, then return the cached copy without 
## re-calculating.  Otherwise, calculate the inverse and store (cache) it away.
cacheSolve <- function(x, ...) {
    # check if there is an inverse (ie inverse already calculated), 
    # if yes, then simply return it
    cachedInverseMtrx <- x$getInverse()
    if (!is.null(cachedInverseMtrx)) {
        # message("getting cache data")
        return(cachedInverseMtrx)
    }
    
    # if reaches here, then an inverse had not been calculated, get the
    # underlying matrix, calculates the inverse, and cache it away
    mtrx <- x$get()

    # even though ... is passed on to the solve function, assuming that
    # the following sequence of function calls will not occur.
    #   1) cacheSolve(x)
    #   2) cacheSolve(x, tol=some_tol)
    # If there is such a sequence of call, the same inverse is returned
    # If this assumption is not made, then we have to cache the ... too
    # and check if there is any change between 2 calls
    newInverseMtrx <- solve(mtrx, ...)
    x$setInverse(newInverseMtrx)
    
    # return the newly calculated inverse
    newInverseMtrx
}
