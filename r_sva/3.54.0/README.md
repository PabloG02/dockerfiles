# This image belongs to a larger project called Bioinformatics Docker Images Project (http://pegi3s.github.io/dockerfiles)
## (Please note that the original software licenses still apply)

This image allows the usage of the [SVA](https://www.bioconductor.org/packages/release/bioc/html/sva.html) Bioconductor package, a package that contains several functions for removing batch effects and other unwanted variation in high-throughput experiment

The image includes, among others, the following packages:
- [sva](https://www.bioconductor.org/packages/release/bioc/html/sva.html) version 3.54.0.
- [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html) version 3.5.1.

# Using the `r_sva` image in Linux

You should adapt and run the following command: `docker run --rm -it -v /your/data/dir:/data pegi3s/r_sva Rscript /data/script.R`

In this command, you should replace:
- `/your/data/dir` to point to the directory that contains the input files you want to analyze and the R script to be executed.
- `script.R` to the actual name of your script using sva (i.e. containing `library("sva")`).

# Using the `r_sva` image in Windows

Please note that data must be under the same drive than the Docker Toolbox installation (usually `C:`) and in a folder with write permissions (e.g. `C:/Users/User_name/`).

You should adapt and run the following command: `docker run --rm -it -v "/c/Users/User_name/dir/":/data pegi3s/r_sva Rscript /data/script.R`