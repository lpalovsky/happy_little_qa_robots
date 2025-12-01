*** Settings ***
Documentation   SAP ABAP AS WEB UI related tests.
...
...     = Maintainer =
...     QE-SAP <qe-sap@suse.de>
...
...     = Suite description: =
...     Suite tests ABAP AS Web UI access

Library  Browser

*** Variables ***
${WEBUI_URL}  http://192.168.122.176:8080/sap/bc/gui/sap/its/webgui/
${ABAP_USER}  SAP*

*** Test Cases ***
Open Webui and login
    [Documentation]  "Checking WEBui login"
    New Browser  firefox  headless=True
    New Context
    New Page    ${WEBUI_URL}
    Take Screenshot


