# Full contents of Dockerfile
FROM rocker/tidyverse
LABEL description="Base docker image with tidyverse and hence R and util libraries"
ARG ENV_NAME="combine-matrices"

RUN apt-get update && \ 
    apt-get clean -y


#
# Jupytext can be used to convert this to a a notebook
# as a script it can be used in a workflow
#
# to run as a script you can use Rscript Rscript
#
# you need to put your R script from the local directory into
# an accessible location for execution at the command line with
# the docker file
#
ADD ./combine_matrices.R /usr/local/bin/

RUN chmod +x /usr/local/bin/combine_matrices.R


