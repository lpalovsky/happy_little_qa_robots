*** Settings ***
Documentation  Library handling XML based output returned from zypper package manager
Library  Collections
Library  XML

*** Keywords ***
Zypper Get Updates
    [Documentation]  Parses zypper xml output and returns list of packages with new pending updates
...     = *Arguments* =
...     *zypper_xml:* Output from zypper in XML format (--xmlout argument).
    [Arguments]  ${zypper_xml}
    ${parsed_xml}=  Parse XML    ${zypper_xml}
    ${packages}=  Create List
    ${update_elements}=  Get Elements  ${parsed_xml}  .//update

    FOR  ${element}  IN  @{update_elements}
        ${package_name}=  Get Element Attribute    ${element}    name
        Append To List  ${packages}  ${package_name}
    END
    RETURN  ${packages}
