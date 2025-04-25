.PHONY: all
all:		clean \
				data/raw/raw.csv \
				data/processed/movies_clean.csv \
				results/tables/summary.csv \
				results/figures/viz.png \
				results/tables/model_summary.csv \
				results/model.rds \
				results/tables/predictions.csv \
				results/figures/fitted.png

data/raw/raw.csv:
				Rscript scripts/01_load.R data/raw/raw.csv
				
data/processed/movies_clean.csv: data/raw/raw.csv
				Rscript scripts/01_load.R data/processed/movies_clean.csv

results/tables/summary.csv: data/processed/movies_clean.csv
				Rscript scripts/02_eda.R results/tables/summary.csv
				
results/figures/viz.png: data/processed/movies_clean.csv
				Rscript scripts/02_eda.R results/figures/viz.png
				
results/tables/model_summary.csv: data/processed/movies_clean.csv
				Rscript scripts/03_model.R results/tables/model_summary.csv
				
results/model.rds: data/processed/movies_clean.csv
				Rscript scripts/03_model.R results/model.rds

results/tables/predictions.csv: data/processed/movies_clean.csv
				Rscript scripts/04_results.R results/tables/predictions.csv

results/figures/fitted.png: data/processed/movies_clean.csv results/model.rds
				Rscript scripts/04_results.R results/figures/fitted.png
				
				
clean:
				rm -rf data/processed/*
				rm -rf results/*
				rm -rf reports/imdb_analysis.html