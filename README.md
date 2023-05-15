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
