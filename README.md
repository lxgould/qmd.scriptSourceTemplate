# Automated Scripting on Connect

repo
: shiny.scriptingTemplate

Many shiny apps rely on data files to be generated on a regular schedule.  In
the past this was done with shell scripts and a crontab.  Now that SPG has
Posit Connect, we can schedule script execution through Connect.

This repository contains a simple shiny app sfor testing and a Quarto documents 
for executing scripts, generating reports and sending conditional emails.

## Repository Structure

- *app.R*: simple shiny app that reads data from a file in the shiny-data directory structure
- getData/
    - *make_data_file.qmd*: Quarto file with code chunks for running scripts
    - *make_data_file.R*: Script for creating the data read by *app.R*
    - *run_something.R*: Script for generating output in the qmd file
    - rsconnect/: Connect configuration for publishing *make_data_file.qmd*
- rsconnect/: Connect configuration for publishing *app.R*

## Summary

- *app.R* is published at [https://connect.spgenetics.com/scriptingTemplate_app/](https://connect.spgenetics.com/scriptingTemplate_app/)
- *make_data_file.qmd* is published at [https://connect.spgenetics.com/scriptingTemplate_rpt/](https://connect.spgenetics.com/scriptingTemplate_rpt/)

*make_data_file.qmd* runs every 30 minutes on the hour and half hour.  It sources the *make_data_file.R* and *run_something.R*
scripts.  The order of execution is:

1. *make_data_file.R*:
    - randomly throws an error to test *make_data_file.qmd*'s error handling
    - If no error:
        - writes current date to a file
        - generates simulated data
        - plots data
        - analyzes data with simple linear model
        - outputs ANOVA table of analysis
3. *run_something.R*
    - generates simulated data
    - plots data
    - analyzes data with simple linear model
    - outputs ANOVA table of analysis
  
## To Do

1. An error in *make_data_file.R* causes the entire Quarto rendering to abort.  Ideally, the error in *make_data_file.R* should be reported and execution should continue on to *run_something.R*
    - It works as expected when executed from my local R-Studio.
2. Scripts are executed in a loop.  The goal is to have a section header followed by script output.  However, the only section header I've managed to implement is simple text as opposed to h2 or h3 text.  The "asis" chunk option halts rendering with an error and raw html can not be escaped with `knitr::raw_html()` inside a loop.
3. Email is generated using {sendmailR} within the qmd file.  Is this sufficient?

