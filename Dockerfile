FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN apt-get update && \
    apt-get install -y libglpk-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('bhklab/bioc2020workshop', update = TRUE, ask=FALSE)"
