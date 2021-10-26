*** Settings ***
Documentation  Suite description
Resource    ../po/addFilters.robot

*** Keywords ***

filter test
    addFilters.Go to Kariyer.Net Job Posting Page
    addFilters.Verify Job Posting Page
    addFilters.Get total count of job posting
    addFilters.Choose a country
    addFilters.Choose a city
    addFilters.Choose a district
    addFilters.choose a date
    addFilters.click the apply button
    addFilters.get count of job postings after filters
    addFilters.get count of filters after filter selection
    addFilters.compare count of job posting



