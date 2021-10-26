*** Settings ***
Documentation  Suite description
Resource    ../po/removeAllFilters.robot
Resource    ../App/removeFiltersApp.robot

*** Keywords ***
remove all filters
    removeFiltersApp.remove test
    removeAllFilters.Remove All Filters
    removeAllFilters.check all filters are deleted
    removeAllFilters.get total count of job posting after remove all
    removeAllFilters.compare count of job posting
