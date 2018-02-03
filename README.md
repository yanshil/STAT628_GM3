# Body Fat - Rule of Thumb

## Description

This repo is for course project of STAT 628 (Spring 2018, University of Wisconsin-Madiosn).

The goal is to get a *Rule of Thumb* to estimate body fat from commonly available measurements like weight, height and age. 


* `./code/`: All related code for analysis
    * `1_Explaratory_Cleaning.R`
    * `2_variable_selection.R`
    * `3_finalmodel_diagnosis.R`
    * `4_bodyfat_plot.R`
* `./data/`
    * `BodyFat.csv`
    * `CleanedBodyFat.csv`
* `./image/`: The generated figures. Including explaratory analysis and result visualization
    * The numbers before graphs are corresponding to the code generated them. e.g. `./image/1.check42.png` is generated from `./code/1_Explaratory_Cleaning.R`
* `./ExecutiveSummary`: With an easy-to-read Jupyter Notebook summary

## Reproducible Requirements

All code use is included in the `code` folder. The following packages are needed to be installed to run the code.

```
car
corrplot
tidyverse
ggplot2
```


