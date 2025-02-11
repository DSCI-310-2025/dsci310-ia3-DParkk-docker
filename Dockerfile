FROM rocker/rstudio:4.4.2
COPY renv.lock /home/rstudio/renv.lock
RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "remotes::install_version('cowsay', version='1.0.0')"
