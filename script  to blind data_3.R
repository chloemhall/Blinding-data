#script to blind data files
#set working directory to a folder which contains only the files to rename
setwd("path/to/folder")

#get a list of all the files 
files.list <- list.files()

#generate random numbers for the files 
how.many= length(files.list)
random <- sample(1:700, how.many, replace=TRUE)


# Generate new random names for the files
new_names <- paste0("file_", random)

# Ensure uniqueness of new names
duplicated_names <- duplicated(new_names)
while (any(duplicated_names)) {
  duplicated_indices <- which(duplicated_names)
  new_random <- sample(1:700, length(duplicated_indices), replace = TRUE)
  new_names[duplicated_indices] <- paste0("file_", new_random)
  duplicated_names <- duplicated(new_names)
}

# Get the file extensions
file_exts <- tools::file_ext(files.list)

# Combine the new names and file extensions
new_names_ext <- paste0(new_names, ".", file_exts)

# Rename the files
file.rename(files.list, new_names_ext)

stored.list <- data.frame(old_name = files.list, new_name = new_names_ext)


# Save the stored list as a .csv
write.csv(stored.list, "List_to_Unblind_Data.csv", row.names = FALSE)

# Optional: Read a file for further processing (commented out)
# checking <- read.csv(file.choose())
# file1 <- read.csv(file.choose())

# Print a message indicating successful completion
cat("File renaming completed successfully.\n")
#This version of the script addresses the issue of blank new_names by generating random names directly and ensuring their uniqueness. It also streamlines the random number generation and improves the overall efficiency of the script. Remember to adjust the path and directory based on your specific file structure.






