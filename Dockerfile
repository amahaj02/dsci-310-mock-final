FROM rocker/verse:4.4.2

WORKDIR /home/rstudio/project

COPY imdb_analysis.qmd ./analysis.qmd
COPY data/* ./data/
RUN mkdir output

EXPOSE 8888

CMD ["bash", "-c", "quarto render analysis.qmd --output-dir output && python3 -m http.server 8888 --directory output"]