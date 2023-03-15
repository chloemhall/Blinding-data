#script to blind data files
#set working directory to a folder which contains only the files to rename
setwd("path/to/folder")

#get a list of all the files 
files.list <- list.files()

#generate random numbers for the files 
how.many= length(files.list)
random <- sample(1:700, how.many, replace=TRUE)

#generate new random names for the files
#new_names <- paste0("file_", sample(random))

#generate new random names for the files
new_names <- vector(mode="character", length=length(files.list))
for (i in seq_along(files.list)) {
  name_is_unique <- FALSE
  while (!name_is_unique) {
    new_name <- paste0("file_", sample(random, 1))
    if (!new_name %in% new_names) {
      new_names[i] <- new_name
      name_is_unique <- TRUE
    }
  }
}

# Get the file extensions
file_exts <- tools::file_ext(files.list)

# Combine the new names and file extensions
new_names_ext <- paste0(new_names, ".", file_exts)

# Rename the files
file.rename(files.list, new_names_ext)

stored.list <- data.frame(old_name = files.list, new_name = new_names_ext)

#now save the stored list. Can save as either a .csv or .txt
write.csv(stored.list, "List_to_Unblind_Data_15missing.csv")
write.table(stored.list,"List_to_Unblind_Data.txt",sep="\t",row.names=FALSE)

checking <- read.csv(file.choose())

file1 <- read.csv(file.choose())
