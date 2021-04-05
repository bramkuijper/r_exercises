library("WriteXLS")

nsheets <- 10

for (n.i in seq(1,nsheets,1))
{
    single.sheet <- expand.grid(treatment=1:3
            ,individual=1:10)

    single.sheet[,"size"] <- single.sheet[,"treatment"]*3

    single.sheet[,"size"] <- single.sheet[,"size"] + rnorm(n=nrow(single.sheet))

    WriteXLS(x="single.sheet"
            ,ExcelFileName = paste0("sheet_",n.i,".xls")
            )
}
