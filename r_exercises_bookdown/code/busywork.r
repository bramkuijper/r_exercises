file.path <- "~/some_file.txt"


for (i in 1:100)
{
    # write a message to the screen
    print(paste("writing line",i))

    # open a file in 'append' mode
    file.object <- file(description=file.path, open="a")

    # write a single line to file with a number
    writeLines(text=as.character(i),con=file.object)

    # close the file
    close(file.object)

    # wait 2 seconds before moving on to the following line
    Sys.sleep(2);
}



