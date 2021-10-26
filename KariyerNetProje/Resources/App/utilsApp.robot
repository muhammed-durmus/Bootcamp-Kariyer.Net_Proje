*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

create session
    open browser    about:blank    chrome
    maximize browser window

close session
    close browser