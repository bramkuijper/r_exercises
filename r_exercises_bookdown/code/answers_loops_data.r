## @knitr ex_ch3-1 ------------------------
suppressMessages(library("readxl", verbose=F))
suppressMessages(library("dplyr", verbose=F))
suppressMessages(library("here", verbose=F))

main.path <- here()
path.name <- file.path(main.path,"code/")

# use the list.files command
# we use a so-called regular expression to
# select any name that starts with sheet
# then followed by a sequence that can
# consist of any character: '.'
# and that sequence can by of any length: '*'
# followed by xls, hence 'sheet.*xls'
# this is not yet totally precise as
# it would also match 'what_sheet_is_this_xls_about'
# but you can refine it using regular expressions
xls_sheet_list <- list.files(
  path=path.name
  ,pattern="sheet.*xls")

stopifnot(length(xls_sheet_list) > 0)

print(xls_sheet_list)

## @knitr end_ex_ch3-1 ------------------------


## @knitr ex_ch3-2 ------------------------

xls_sheet_list <- list.files(
  path=path.name
  ,full.names = TRUE
  ,pattern="sheet.*xls")

stopifnot(length(xls_sheet_list) > 0)

print(xls_sheet_list)

## @knitr end_ex_ch3-2 ------------------------

## @knitr ex_ch3-3 ------------------------

# open a single file
single.file <- read_excel(path=xls_sheet_list[[1]])

print(xls_sheet_list[[1]])
print(slice_head(single.file,n=5))

## @knitr end_ex_ch3-3 ------------------------


## @knitr ex_ch3-4 ------------------------

# start the for loop where a list of
# full path names are
# contained in the variable xls_sheet_list
for (file_idx in 1:length(xls_sheet_list))
{
  tmp_tbl <- read_excel(path=xls_sheet_list[[file_idx]])

  print(paste("path name:",xls_sheet_list[[file_idx]]))
  print(paste("rows:",nrow(tmp_tbl)))
  print(paste("column names:",paste(names(tmp_tbl),collapse=",")))
}

## @knitr end_ex_ch3-4 ------------------------

## @knitr ex_ch3-5 ------------------------

# always start with an empty tibble
super_tbl <- tibble()

for (file_idx in 1:length(xls_sheet_list))
{
  # open each file
  tmp_tbl <- read_excel(path=xls_sheet_list[[file_idx]])

  # append it to the tibble using bind_rows
  super_tbl <- bind_rows(super_tbl, tmp_tbl)
}

print(super_tbl)
print(summary(super_tbl))

## @knitr end_ex_ch3-5 ------------------------

## @knitr ex_ch3-6 ------------------------
suppressMessages(library("ggplot2"))

ggplot(data=super_tbl
       ,mapping=aes(x=treatment, y=size, color=individual)) +
  geom_point()

## @knitr end_ex_ch3-6 ------------------------


## @knitr ex_ch3-7 ------------------------
super_tbl <- mutate(super_tbl
                     ,individual_fac=as.factor(individual)
                     ,treatment_fac=as.factor(treatment))

ggplot(data=super_tbl
       ,mapping=aes(x=treatment_fac, y=size, color=individual_fac)) +
  geom_point()

## @knitr end_ex_ch3-7 ------------------------

for (file_idx in 1:length(xls_sheet_list))
{
  a <- sub(pattern=".*sheet_(\\d{1,2})\\.xls"
            ,replacement="\\1"
            ,x=xls_sheet_list[[file_idx]])

  print(a)
}


