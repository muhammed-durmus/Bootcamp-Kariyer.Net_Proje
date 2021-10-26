*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***

${LOCATION}    https://www.kariyer.net/is-ilanlari
${DISTRICT-DROPBOX}    css=[data-test="district-arrow-icon"]
${APPLY_BUTTON}    css=[data-test="apply-button"]
${COUNTRY_1}    css=ul[role='menu'] > li:nth-of-type(1) > a[role='menuitem']
${CITY_1}    xpath=//div[@id='filter-section']/div[@class='k-space large right']/div/div[1]/div/div[2]/div/div[2]/div[2]/div[@role='dialog']/div/div/div[@class='modal-body mr-4 pr-3']/div[@class='checkbox-field kNetScroll']/div[1]/div[@class='checkbox-items']/div/div/label[@class='custom-control-label']     #İstanbul tümü seçilir
${DISTRICT_1}    css=[aria-describedby] [data-test='checkbox-district-items']:nth-of-type(1) .custom-checkbox
${SEARCH_RESULT}    css=[class='t-6 text-secondary mb-3 search-result-section']
${CHOICEN_FILTERS}    //div[@class='label label-default chips']
${CLOSE}    css=.modal-backdrop


*** Keywords ***

Go to Kariyer.Net Job Posting Page
    go to    https://www.kariyer.net/is-ilanlari

Verify Job Posting Page
    element should contain    css=[aria-current]    İş İlanları
    wait until location is  ${LOCATION}

Get total count of job posting    #Başlangıçtaki toplam iş ilanı sayısı
    ${TotalJobs}=    get text    ${SEARCH_RESULT}
    set global variable    ${TotalJobs}

   # ${totalJobsStr}=    Remove String        ${TotalJobs}   ,    İş İlanları
   # ${totalJobsInt}=    convert to integer  ${totalJobsStr}


Choose a country
    click element    css=[data-test="country-title"]
    wait until page contains element  ${COUNTRY_1}
    click element    ${COUNTRY_1}

Choose a city
    click element    css=[data-test="city-title"]
    wait until page contains element    css=.modal-blue-border.k-shadow
    click element    ${CITY_1}
    click element    ${CLOSE}  #css=.modal-blue-border.k-shadow [class='material-icons p-1']


Choose a district
    wait until element is visible  ${DISTRICT-DROPBOX}
    click element    ${DISTRICT-DROPBOX}
    wait until page contains element  ${DISTRICT_1}
    click element    ${DISTRICT_1}
    wait until element is enabled    css=[data-test="close-icon"]
    click element    ${CLOSE}

choose a date
    click element    css=[for='__BVID__238']

click the apply button
    page should contain element    ${APPLY_BUTTON}
    click element    ${APPLY_BUTTON}
    sleep    5s

get count of job postings after filters    #filtrelerden sonraki toplam iş ilanı sayısı
    ${TotalJobs1}=    get text    ${SEARCH_RESULT}
    set global variable    ${TotalJobs1}

get count of filters after filter selection
    ${filtcount1}=    get element count    ${CHOICEN_FILTERS}    #toplam filtre sayısı
    set global variable  ${filtcount1}

compare count of job posting    #filtreler eklenmeden önce ve eklendikten sonraki iş ilanı sayılarının karşılaştırılması
    should not be equal    ${TotalJobs1}  ${TotalJobs}