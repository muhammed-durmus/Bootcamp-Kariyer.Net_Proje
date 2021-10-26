*** Settings ***
Documentation  Suite description
Resource    ../po/removeFilters.robot
Resource    ../App/addFiltersApp.robot

*** Keywords ***
remove test
    addFiltersApp.filter test
    removefilters.Remove Filters
    removefilters.get filters count after remove
    removefilters.compare count of filters
    removefilters.get total count of job posting after remove filter
    removefilters.compare count of job posting
