FROM rocker/rstudio:4.4.2

WORKDIR /home/rstudio/

COPY renv.lock renv.lock

RUN Rscript -e "install.packages(c('renv', 'remotes'), repos = 'https://cloud.r-project.org')"

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN Rscript -e "remotes::install_version('cowsay', version='1.0.0', repos='https://cloud.r-project.org')"

# Add glue package (To trigger rebuild)
RUN Rscript -e "install.packages('glue', repos = 'https://cloud.r-project.org')"

# Add stringr package (To trigger rebuild)
RUN Rscript -e "install.packages('stringr', repos = 'https://cloud.r-project.org')"

