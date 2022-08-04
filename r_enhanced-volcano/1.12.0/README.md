# This image belongs to a larger project called Bioinformatics Docker Images Project (http://pegi3s.github.io/dockerfiles)
## (Please note that the original software licenses still apply)

This image allows the usage of the [EnhancedVolcano](http://www.bioconductor.org/packages/release/bioc/html/EnhancedVolcano.html) Bioconductor package, a highly-configurable function that produces publication-ready volcano plots. 

# Using the R Project image in Linux

You should adapt and run the following command: `docker run --rm -it -v /your/data/dir:/data pegi3s/r_enhanced-volcano Rscript /data/script.R`

In this command, you should replace:
- `/your/data/dir` to point to the directory that contains the input files from which you want to produce the volcano plots.
- `script.R` to the actual name of your script using EnhancedVolcano (i.e. containing `library("EnhancedVolcano")`).

# Using the R Project image in Windows

Please note that data must be under the same drive than the Docker Toolbox installation (usually `C:`) and in a folder with write permissions (e.g. `C:/Users/User_name/`).

You should adapt and run the following command: `docker run --rm -it -v "/c/Users/User_name/dir/":/data pegi3s/r_enhanced-volcano Rscript /data/script.R`