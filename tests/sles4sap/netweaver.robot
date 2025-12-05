*** Settings ***
Documentation   SAP ABAP AS WEB UI related tests.
...
...     = Maintainer =
...     QE-SAP <qe-sap@suse.de>
...
...     = Suite description: =
...     Suite tests ABAP AS Web UI access

Library  Browser
Resource  resources/sles4sap/netweaver_web.resource
Suite Setup  Open GUI Page

*** Variables ***
${ABAP_USER}  SAP*

*** Test Cases ***
Test ABAP Login
    Netweaver Log In

Test transaction SICK
    Open Transaction  transaction_code=SICK

Test transaction ST22
    Open Transaction  transaction_code=ST22

Test ABAP Log Off
    Netweaver Log Off

*** Keywords ***
Open GUI Page
    [Documentation]  Opens browser with NW WEB UI page loaded.
    New Browser  firefox  headless=False
    New Context
    New Page    ${WEBUI_URL}

