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

*app.R* is published at [https://connect.spgenetics.com/scriptingTemplate_app/](https://connect.spgenetics.com/scriptingTemplate_app/)
*make_data_file.qmd* is published at [https://connect.spgenetics.com/scriptingTemplate_rpt/](https://connect.spgenetics.com/scriptingTemplate_rpt/)

*make_data_file.qmd* 

: runs on a 30 minute schedule on the hour and half hour.  It sources the *make_data_file.R* and *run_something.R*
scripts