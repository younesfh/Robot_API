*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
*** Variables ***
${URL-base}=    https://thetestingworldapi.com

*** Test Cases ***
TC01_GetSingleStudent    
    Create Session    Mysession    ${URL-base}
    ${Response}=    GET On Session    Mysession    /api/studentsDetails/7478328
    Log    ${Response.status_code}
    Log    ${Response.content}
    ${Response_JSON}=    To Json    ${Response.content}
    @{first_name_list}=    Get Value From Json    ${Response_JSON}    data.first_name
    ${first_name}=    Get From List    ${first_name_list}    0
    Log    ${first_name}
    Should Be Equal As Strings    ${first_name}    Younes
    Should Be Equal As Integers    ${Response.status_code}    200



*** Keywords *** 