*** Settings ***
Library     Browser
Variables   data/sles4sap/netweaver_locators.py

*** Variables ***
${locator_timeout}=  5s

*** Keywords ***
Netweaver Log Off
    [Documentation]  Clicks on 'Log off' button, then 'Yes' and waits for  'logged out' screen
    Take Screenshot
    Open Home Transaction
    # Wait and click on "Log off" button
    Wait For Elements State  ${its_iframe} >>> ${log_off_button}  attached  timeout=${locator_timeout}
    Wait For Elements State  ${its_iframe} >>> ${log_off_button}  visible  timeout=${locator_timeout}
    Click    ${its_iframe} >>> ${log_off_button}
    Take Screenshot
    # Click on 'Yes' button
    Wait For Elements State  ${its_iframe} >>> id=M1:46:::3:6  visible  timeout=${locator_timeout}
    Wait For Elements State  ${its_iframe} >>> id=M1:46:::3:6  attached  timeout=${locator_timeout}
    Click    ${its_iframe} >>> id=M1:46:::3:6
    Wait For Elements State  ${its_iframe} >>> text=logged off  visible  timeout=${locator_timeout}
    Take Screenshot

Netweaver Log In
    [Documentation]  Fills in Login credentials and waits for splash to dissappear
    Take Screenshot
    Fill Text    id=sap-user    ${ABAP_USER}
    Fill Secret    id=sap-password    $ABAP_PASSWORD
    Click    id=LOGON_BUTTON
    Wait For Navigation    url=${WEBUI_URL}*  timeout=10s    wait_until=networkidle
    ${exists}=    Run Keyword And Return Status
    ...    Get Element States    css=span.lsButton__text
    Log  EXISTS:${exists}
    # Wait for splash screen to dissappear
    Wait For Elements State  id=CenterBox  hidden  timeout=${locator_timeout}
    Take Screenshot

Open Transaction
    [Documentation]  Opens transaction by typing TR Code into input area
    [Arguments]    ${transaction_code}=${none}
    Wait For Transaction Input
    Fill Text    ${its_iframe} >>> ${transaction_input}    /n${transaction_code}
    Take Screenshot  selector=${its_iframe} >>> id=cuapanel
    Keyboard Key    press    Enter
    Sleep    1s
    # Wait for splash screen to dissappear
    Wait For Elements State  id=CenterBox  hidden  timeout=${locator_timeout}
    Wait For Transaction Input
    Take Screenshot

Wait For Transaction Input
    [Documentation]    Wait for transaction input locator to be active and visible
    Wait For Elements State  ${its_iframe} >>> ${transaction_input}  visible  timeout=${locator_timeout}
    Wait For Elements State  ${its_iframe} >>> ${transaction_input}  attached  timeout=${locator_timeout}

Open Home Transaction
    [Documentation]  Fills in Login credentials and waits for splash to dissappear ToolbarOkCode
    Take Screenshot
    Wait For Elements State  ${its_iframe} >>> ${transaction_input}  visible  timeout=${locator_timeout}
    Wait For Elements State  ${its_iframe} >>> ${transaction_input}  attached  timeout=${locator_timeout}
    Fill Text    ${its_iframe} >>> ${transaction_input}    /n
    Take Screenshot  selector=${its_iframe} >>> id=cuapanel
    Keyboard Key    press    Enter
    Wait For Elements State  id=CenterBox  hidden  timeout=${locator_timeout}
    Take Screenshot
