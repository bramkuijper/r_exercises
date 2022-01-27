# exercises for the 'other loops' chapter


## @knitr ex_param_combis ------------------------
# say we have two parameters of which we want
# to produce all possible permutations
# n.f = c(1,2,3,4,5,6,7,8)
# n.m = c(1,2,3,4,5,6,7,8)
# we want to print out all combinations
# so we want to print
# [1] "n.f = 1, n.m = 1"
# [2] "n.f = 2, n.m = 1"
# [3] "n.f = 3, n.m = 1"
# [xx] ...
# however, for some combinations, we want to
# exclude cases where the total number of individuals
# is in the range of (5,10)

#
nf.max <- 5
nm.max <- 15
nf <- seq(1,nf.max)
nm <- seq(1,nm.max)





## @knitr end_ex_param_combis ------------------------



## @knitr ex_loop_other_square ------------------------
# Print a square of stars
# ****************
# *              *
# *              *
# *              *
# ****************

square.width <- 10
square.length <- 5

for (length.idx in seq(1,square.length,1))
{
  str.row <- ""
  for (width.idx in seq(1,square.width,1))
  {
    char <- " "
    if ((length.idx == 1 || length.idx == square.length)
        ||
        (width.idx == 1 || width.idx == square.width))
    {
      char <- "*"
    }
    str.row <- paste0(str.row,char)
  }
  print(str.row)
}


## @knitr end_ex_loop_other_square ------------------------



## @knitr ex_loop_other_triangle ------------------------
# Print a triangle of stars as in
# *******
#  *****
#   ***
#    *

# maximum number of characters per row
# this should always be an odd number
max.chr.row <- 7

# calculate the number of stars
# for each row, noting that you have
# 'work to the middle', meaning when
# you go downwards, you drop the first
# star and the last one
n.stars.per.row <- seq(max.row,1,-2)

for (row.i in 1:length(n.stars.per.row))
{
  # spaces at the start and front
  n.spaces.each.end <- (max.chr.row - n.stars.per.row[[row.i]])/2

  # the actual character string of spaces
  spaces.str <- strrep(x=" ",times=n.spaces.each.end)

  # the actual character string of stars
  stars.str <- strrep(x="*", times=n.stars.per.row[[row.i]])

  total.str <- paste0(spaces.str,stars.str,spaces.str)

  print(total.str)
}



## @knitr end_ex_loop_other_triangle ------------------------
