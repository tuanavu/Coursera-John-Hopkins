##  Catching the Inverse of the Matrix

## The first function, makeCacheMatrix creates a special "matrix", 
## which is really a list containing a function to:
##  1. set the value of the matrix
##  2. get the value of the matrix
##  3. set the value of the inverse
##  4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}



## Test Cases:

a <- makeCacheMatrix(matrix(1:4, 2, 2))
a$get()
cacheSolve(a)

b <- makeCacheMatrix(matrix(4:8, 2, 2))
b$get()
cacheSolve(b)

c = matrix(c(1,-0.25,-0.25,1),nrow=2,ncol=2,byrow=T)
ci = cacheSolve(makeCacheMatrix(a))
ci

d = matrix(c(4,7,2,6),nrow=2,ncol=2,byrow=T)
di = cacheSolve(makeCacheMatrix(a))
di

ai1 = cacheSolve(makeCacheMatrix(a))
am = makeCacheMatrix(a)
ai = cacheSolve(am)
ai2 = cacheSolve(am)
getting cached data
ai %*% a
a %*% ai2
