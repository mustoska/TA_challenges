*** Settings ***
Library    Browser
Library    Collections
Suite Setup    Open Session And The Page
*** Variables ***
${BASE_URL}    https://obstaclecourse.tricentis.com/Obstacles/73589
${MAIN_TITLE}    Tricentis Obstacle Course • Test Automation Obstacle: Bubble Sort
${CORRECT_LIST}    ['1', '2', '3', '4', '5', '6', '7', '8', '9']
${FIRST_BUBBLE_ELE}
${SECOND_BUBBLE_ELE}
${CURRENT_LIST}
*** Test Cases ***

Arragne The Array
    ${CURRENT_LIST}=    Read Array Including Bubble
    WHILE    ${CURRENT_LIST} != ${CORRECT_LIST}
        ${FIRST_BUBBLE_ELE}=    Get The First Bubble Element
        ${SECOND_BUBBLE_ELE}=    Get The Second Bubble Element
        IF    ${FIRST_BUBBLE_ELE} > ${SECOND_BUBBLE_ELE}
            Push Swap Button
        ELSE
            Push Next Button
        END
        Sleep    0.5 sec
        #Stop If Good job! Is Shown
    END
    
*** Keywords ***
Open Session And The Page 
    New Browser    browser=firefox   headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${BASE_URL}
    Get Title      ==    ${MAIN_TITLE}

Push Swap Button
    Click    css=#button1.sortButton

Push Next Button
    Click    css=button#button2.sortButton

Get The First Bubble Element
    ${FIRST_BUBBLE_ELE}=    Get Text    css=.bubble > div.num:nth-child(1)
    ${FIRST_BUBBLE_ELE}=    Convert To Integer    ${FIRST_BUBBLE_ELE}
    RETURN    ${FIRST_BUBBLE_ELE}

Get The Second Bubble Element
    ${SECOND_BUBBLE_ELE}=    Get Text    css=.bubble > div:nth-child(2)
    ${SECOND_BUBBLE_ELE}=    Convert To Integer    ${SECOND_BUBBLE_ELE}
    RETURN    ${SECOND_BUBBLE_ELE}

Read Array Including Bubble
    ${CURRENT_NUMBERS}=    Get Text    css=#array
    ${CURRENT_LIST}=    Convert To List    ${CURRENT_NUMBERS}
    Remove Values From List    ${CURRENT_LIST}    \n
    RETURN    ${CURRENT_LIST}
    
Stop If Good job! Is Shown
    ${PASS_POPUP_SHOWN}=    Run Keyword And Continue On Failure    Get Text    css=.sweet-alert > h2:nth-child(6)
    IF    ${PASS_POPUP_SHOWN} == "Good job!"
        Pass Execution    Puzzle solved!    
    END
    

