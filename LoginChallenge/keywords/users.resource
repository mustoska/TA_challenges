*** Settings ***
Library    Browser

*** Variables ***
${BARCELONA_GEOLOC_LAT} =    41.390205
${BARCELONA_GEOLOC_LONG} =    2.154007
${OSLO_GEOLOC_LAT} =    59.911491
${OSLO_GEOLOC_LONG} =    10.757933
${SAO_PAOLO_LAT} =    -23.533773
${SAO_PAOLO_LONG} =    -46.625290

*** Keywords ***
User From Barcelona Opens New Firefox UHD Session, Headless
    [Documentation]     Open new firefox browser. Use UHD width x height. 
    ...    Set context to Barcelona. Login in Succesfully and log out. Run headless.
    New Browser    browser=firefox  headless=False
    New Context    viewport={'width': 3840, 'height': 2160}
    Set Geolocation    ${BARCELONA_GEOLOC_LAT}     ${BARCELONA_GEOLOC_LONG}
    
User From Oslo Opens New Chromium HD Session, Not Headless
    [Documentation]          Open new chromium browser. Use HD width x height. 
    ...    Set context to Oslo. Login in Succesfully and log out. Do not run headless. Added delays for visualization.
    New Browser    browser=chromium   headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    Set Geolocation       ${OSLO_GEOLOC_LAT}     ${OSLO_GEOLOC_LONG}

User From Sao Paolo Opens New Webkit UHD Session, Not Headless
    [Documentation]          Open new webkit browser. Use HD width x height. 
    ...    Set context to Sao Paolo. Login in Succesfully and log out. Do not run headless. Added delays for visualization.
    New Browser    browser=webkit   headless=True
    New Context    viewport={'width': 3840, 'height': 2160}
    Set Geolocation    ${SAO_PAOLO_LAT}     ${SAO_PAOLO_LONG}

Close All Contexts, Pages And Browsers
    Close Context    All
    Close Page        All
    Close Browser    All