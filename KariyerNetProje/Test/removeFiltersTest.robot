*** Settings ***
Documentation  Suite description
Resource    ../Resources/App/removeFiltersApp.robot
Resource    ../Resources/App/utilsApp.robot

Test Setup    utilsApp.create session
Test Teardown    utilsApp.close session

*** Test Cases ***
add filter test
    removeFiltersApp.remove test