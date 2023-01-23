*** Settings ***
Documentation    Simple Login Test For The Internet herokuapp
Library    Browser

*** Variables ***
${APPBASEURL}      https://the-internet.herokuapp.com/login

*** Test Cases ***
Crawl Pages And Check Response
    [Documentation]     Crawl subpages and check that all pages are found
    @{URLS}      Crawl Site    ${APPBASEURL}

Open New UHD Firefox Session Headless, Login Succesfully
    [Documentation]     Open new firefox browser. Use UHD width x height. 
    ...    Set context to Barcelona. Login in Succesfully and log out. Run headless.
    New Browser    browser=firefox  headless=True
    New Context    viewport={'width': 3840, 'height': 2160}
    Set Geolocation    41.390205    2.154007
       Go Though Succesful Login Process    0

Open New Chromium Session Non Headless, Login Succesfully, Added Delays
    [Documentation]          Open new chromium browser. Use HD width x height. 
    ...    Set context to Oslo. Login in Succesfully and log out. Do not run headless. Added delays for visualization.
    New Browser    browser=chromium   headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    Set Geolocation    59.911491    10.757933
    Go Though Succesful Login Process    10 ms
    
Open New Webkit Session Headless, Login Unsuccesfully
    [Documentation]          Open new webkit browser. Use HD width x height. 
    ...    Set context to Sao Paolo. Login in Succesfully and log out. Do not run headless. Added delays for visualization.
    New Browser    browser=webkit   headless=True
    New Context    viewport={'width': 1920, 'height': 1080}
    Set Geolocation    -23.533773     -46.625290
    Go Though Succesful Login Process    0

*** Keywords ***
Go Though Succesful Login Process
    [Arguments]    ${delay}
    New Page       ${APPBASEURL}
    Get Title    ==    The Internet
    Type Text    id=username    txt=tomsmith    delay=${delay}
    Type Text    id=password    txt=SuperSecretPassword!    delay=${delay}
    Click       css=html.no-js body div.row div#content.large-12.columns div.example form#login button.radius i.fa.fa-2x.fa-sign-in
    Wait For Elements State     text="Secure Area"
    Click        css=.button
    Close Context
    