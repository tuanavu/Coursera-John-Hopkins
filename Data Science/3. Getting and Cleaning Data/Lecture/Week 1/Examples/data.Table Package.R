library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)

DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

tables()

DT[2,]
DT[DT$y=="a",]
DT[c(2,3)]
DT[,c(2,3)]

{
    x = 1
    y = 2
}
k = {print(10); 5}
print(k)

DT[,list(mean(x),sum(z))]

DT[,w:=z^2]

DT2 <- DT
DT[, y:= 2]

head(DT,n=3)
head(DT2,n=3)

## Multiple operations
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]

## plyr like operations
DT[,a:=x>0]
DT[,b:= mean(x+w),by=a]

## Special Variables
set.seed(123);
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

## Keys
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

##Joins
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)

## Fast reading
big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file))

system.time(read.table(file, header=TRUE, sep="\t"))
