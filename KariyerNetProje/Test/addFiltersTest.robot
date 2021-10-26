*** Settings ***
Documentation  Suite description
Resource    ../Resources/App/addFiltersApp.robot
Resource    ../Resources/App/utilsApp.robot

Test Setup    utilsApp.create session
Test Teardown    utilsApp.close session

*** Test Cases ***
add filter test
    addFiltersApp.filter test