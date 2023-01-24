*** Settings ***
Library    Browser

*** Keywords ***
You Logged Into A Secure Area-Message Is Shown
    Wait For Elements State     css=#flash    message="You logged into a secure area!"

User Is In Secure Page
    Wait For Elements State     css=.example > h2:nth-child(1)    message="Secure Area"

User Logs Out From Secure Page
    Click        css=.button
