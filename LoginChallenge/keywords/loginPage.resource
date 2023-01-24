*** Settings ***
Library    Browser

*** Variables ***
${APPBASEURL} =     https://the-internet.herokuapp.com/login
${USERNAME_USER1} =    tomsmith
${USER1_PASSWORD} =     SuperSecretPassword!
${NOT_VALID_USERNAME} =    tomppa
${NOT_VALID_PASSWORD} =     SuperSalainenPassi

*** Keywords ***
User Opens Heroku Page
    New Page       ${APPBASEURL}
    Get Title    ==    The Internet

User Logs In With Correct Credentials, Use Type Delay
    [Arguments]    ${custom_delay}
    Type Text    id=username    txt=${USERNAME_USER1}    delay=${custom_delay}
    Type Text    id=password    txt=${USER1_PASSWORD}    delay=${custom_delay}
    Click        css=.radius

User Logs In With Incorrect Credentials
    Type Text    id=username    txt=${NOT_VALID_USERNAME}
    Type Text    id=password    txt=${NOT_VALID_PASSWORD}
    Click        xpath=/html/body/div[2]/div/div/form/button 
    
Username Is Invalid Message Is Shown
    Wait For Elements State     xpath=//*[@id="flash"]    message=Your username is invalid!