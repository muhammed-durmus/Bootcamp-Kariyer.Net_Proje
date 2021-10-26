*** Settings ***
Library  SeleniumLibrary
Resource    ../po/addFilters.robot

*** Variables ***
${SEARCH_RESULT}  css=[class='t-6 text-secondary mb-3 search-result-section']
${FILTER_1}    css=div:nth-of-type(1) > .material-icons
${CLOSE_FILTER}    css=.chips-wrapper > div:nth-of-type(1) > .material-icons


*** Keywords ***

Remove Filters
    wait until page contains element    ${FILTER_1}
    click element    css=.chips-wrapper > div:nth-of-type(1) > .material-icons
    sleep    5s

get filters count after remove
    ${filtcount2}=    get element count    //div[@class='label label-default chips']  #2 filtre kaldırıldıktan sonraki toplam filtre sayısı
    set global variable  ${filtcount2}

compare count of filters
    should be true    '${filtcount2}'<'${filtcount1}'

get total count of job posting after remove filter    # 2 filtre kaldırıldıktan sonraki iş ilanı sayısı
    ${totalJobs2}=    get text    ${SEARCH_RESULT}
    set global variable    ${totalJobs2}

compare count of job posting
    should not be equal    ${TotalJobs1}    ${totalJobs2}    # ${TotalJobs1} => Filtreler eklendikten sonraki iş ilanı sayısı

