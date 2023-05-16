This Docker image combines two matrices using the intersection of rows

For gene expression files, columns represent subjects and rows represent genes

The output is a .csv file with the intersection of genes and all columns from both files

To execute in the command line, use: 
```
Rscript combine_matrices.R --m1="path/to/file1" --m2="path/to/file2"
```


Build a Container for the combine-matrices-docker

Steps to build this docker container.

Set up GitHub Actions
To build your image from the command line:

Can do this on Google shell - docker is installed and available
```
docker build -t combine-matrices .
```

To test this tool from the command line

Set up an environment variable capturing your current command line:
```
PWD=$(pwd)
```
Then mount and use your current directory and call the tool now encapsulated within the environment.

```
docker run -it -v $PWD:$PWD -w $PWD combine-matrices Rscript yourname.R
```
