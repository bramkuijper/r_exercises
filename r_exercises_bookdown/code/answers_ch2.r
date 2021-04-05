## @knitr ex_ch2_list ------------------------

# a list of values
my.list <- c(5,10,19,22,3,40,48)

## @knitr end_ex_ch2_list ------------------------




## @knitr ex2-1 ------------------------

# loop
for (i in 1:length(my.list))
{
    # print output
    print(my.list[[i]])
}
## @knitr end_ex2-1 ------------------------


## @knitr ex2-2 ------------------------

# variable to store the total
total <- 0

for (i in 1:length(my.list))
{
    total <- total + my.list[[i]]
}

print(paste("The sum of the list is",total))

## @knitr end_ex2-2 ------------------------


## @knitr ex2-3 ------------------------
# sum of list and sum of squares


# variables to store total 
# and total for sum of squares
total <- 0
total.ss <- 0

# loop through the elements of the list
for (i in 1:length(my.list))
{
    # update total
    total <- total +  my.list[[i]]

    # update total sum of squares
    total.ss <- total.ss + my.list[[i]]^2
}

# create a message using paste()
msg <- paste("The sum is"
        ,total
        ,"and the sum of squares is"
        ,total.ss)

# print the message
print(msg)

## @knitr end_ex2-3 ------------------------

## @knitr ex2-4 ------------------------
# use if-else to only take values above or
# equal to a 
# threshold value x

# again, the total and the total 
# sum of squares
total <- 0
total.ss <- 0

# set a threshold value
x <- 10

# loop through the elements of the list
for (i in 1:length(my.list))
{
    if (my.list[[i]] >= x)
    {
        # update total
        total <- total +  my.list[[i]]

        # update total sum of squares
        total.ss <- total.ss + my.list[[i]]^2
    }
}

# create a message using paste()
msg <- paste("The sum is"
        ,total
        ,"and the sum of squares is"
        ,total.ss)

# print the message
print(msg)

## @knitr end_ex2-4 ------------------------


## @knitr ex2-5 ------------------------
# sum odd and even numbers separately

# allocate a variable that calculates
# the total and the total sum of squares
# because we have to sum over odd vs even
# numbers each variable is now a vector
# of size 2
total <- c(0,0)
total.ss <- c(0,0)

# loop through the elements of the list
for (i in 1:length(my.list))
{
    # number is even
    if (my.list[[i]] %% 2 == 0)
    {
        # update total
        total[[1]] <- total[[1]] +  my.list[[i]]

        # update total sum of squares
        total.ss[[1]] <- total.ss[[1]] + my.list[[i]]^2
    }
    else
    {
        # update total
        total[[2]] <- total[[2]] +  my.list[[i]]

        # update total sum of squares
        total.ss[[2]] <- total.ss[[2]] + my.list[[i]]^2
    }
}

# note the changed paste statement()
# because we need to add a dot right
# in the middle after total.ss[[1]].
# Hence, we cannot use the default
# way in paste(...,sep=" ") which adds
# spaces in between everything. We
# have to add spaces ourselves
print(paste("Sum of even numbers is "
        ,total[[1]]
        ,". Sum of even squares is "
        ,total.ss[[1]]
        ,"."
        ,sep=""))

print(paste("Sum of odd numbers is "
        ,total[[2]]
        ,". Sum of odd squares is "
        ,total.ss[[2]]
        ,"."
        ,sep=""))


## @knitr end_ex2-5 ------------------------

# Answer to ex 2.5 (more efficient code) ----------------------

# Here, we use an ifelse() clause
# instead, which avoids writing some
# statements like
# total[[j]] <- total[[j]] + my.list[[i]]
# multiple times, resulting in more
# efficient code

# allocate a variable that calculates
# the total and the total sum of squares
# because we have to sum over odd vs even
# numbers each variable is now a vector
# of size 2
total <- c(0,0)
total.ss <- c(0,0)

# loop through the elements of the list
for (i in 1:length(my.list))
{
    # determine whether we have odd or even number
    # on the bases of which we determine the index
    # for the total and total.ss vectors
    total.idx <- ifelse(my.list[[i]] %% 2 == 0, 1,2)

    # update total
    total[[total.idx]] <- total[[total.idx]] +
        my.list[[i]]

    # update total sum of squares
    total.ss[[total.idx]] <- total.ss[[total.idx]] +
        my.list[[i]]^2
}

msg <- paste("The sum of even numbers is "
        ,total[[1]]
        ,".And their sum of squares is "
        ,total.ss[[1]]
        ,". The sum of odd numbers is "
        ,total[[2]]
        ," and their sum of squares is "
        ,total.ss[[2]]
        ,"."
        ,sep="")
# print the message
print(msg)
