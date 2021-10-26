*** Settings ***
Library    SeleniumLibrary
Resource    ../po/removeFilters.robot

*** Variables ***
${CLEAR}    css=.clear-filter
${SEARCH_RESULT}    css=[class='t-6 text-secondary mb-3 search-result-section']
${FILTER_TITLE}    css=.choicen-filters.text-secondary.w-5 > .filter-title

*** Keywords ***

Remove All Filters
    wait until page contains element    ${CLEAR}
    click element    ${CLEAR}
    sleep    5s

check all filters are deleted    #tüm filtrelerin gerçekten kalkıp kalkmadığının kontrolü
    element should not be visible    ${FILTER_TITLE}

get total count of job posting after remove all    #filtreler kaldırıldıktan sonraki iş ilanı sayısı
    ${LastCount}=    get text    ${SEARCH_RESULT}
    set global variable   ${LastCount}

compare count of job posting    # filreler varken ve tüm filtreler kaldırıldıktan sonra toplam iş ilanı sayılarının karşılaştırılması
    should not be equal    ${LastCount}    ${totalJobs2}