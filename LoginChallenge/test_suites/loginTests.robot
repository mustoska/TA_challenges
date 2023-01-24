*** Settings ***
Documentation    Simple Login Test For The Internet herokuapp

Library    Browser
Resource    ../keywords/users.resource
Resource    ../keywords/loginPage.resource
Resource    ../keywords/logoutPage.resource
Resource    ../keywords/users.resource

Suite Setup    Crawl Links
Suite Teardown    Close All Contexts, Pages And Browsers
*** Test Cases ***
User From Oslo Logs In And Out With Correct Credentials
    Given User From Oslo Opens New Chromium HD Session, Not Headless
    When User Opens Heroku Page
    And User Logs In With Correct Credentials, Use Type Delay    10ms
    Then User Is In Secure Page
    And User Logs Out From Secure Page

User From Sao Paolo Logs In And Out With Correct Credentials
    Given User From Sao Paolo Opens New Webkit UHD Session, Not Headless
    When User Opens Heroku Page
    And User Logs In With Correct Credentials, Use Type Delay    0
    Then User Is In Secure Page
    And User Logs Out From Secure Page

User From Oslo Logs In With Fauly Credentials
    Given User From Oslo Opens New Chromium HD Session, Not Headless
    When User Opens Heroku Page
    And User Logs In With Incorrect Credentials
    Then Username Is Invalid Message Is Shown

User From Barcelona Logs In And Out With Correct Credentials
    Given User From Barcelona Opens New Firefox UHD Session, Headless
    When User Opens Heroku Page
    And User Logs In With Correct Credentials, Use Type Delay    50ms
    Then User Is In Secure Page
    And User Logs Out From Secure Page

*** Keywords ***
Crawl Links
    [Documentation]     Crawl subpages and check that all pages are found
    @{URLS}      Crawl Site    ${APPBASEURL}
    

    