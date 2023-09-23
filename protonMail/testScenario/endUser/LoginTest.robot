*** Settings ***
Library     SeleniumLibrary
Resource    ../../pageObject/endUser/LoginPage.robot
Resource    ../../pageObject/global/Global.robot

*** Keyword ***
valid login to proton
    [Arguments]     ${email}            ${password}
    GIVEN user on the login page
    WHEN user input username and password       ${email}            ${password}
    AND user click sign in button
    THEN user can see proton dashboard

valid login to facebook
    [Arguments]     ${email}            ${password}
    GIVEN user on the facebook login page
    WHEN user input facebook username and password       ${email}       ${password}
    AND user click facebook sign in button
    THEN user can see facebook home

post result to practitest
    GIVEN ehe

Example Test Case 1
    [Test Steps]    ${response}=    Post Request    https://api.example.com    data={"name": "Test1"}
    Should Be Equal As Strings    ${response.status_code}    200

Example Test Case 2
    [Test Steps]    ${response}=    Post Request    https://api.example.com    data={"name": "Test2"}
    Should Be Equal As Strings    ${response.status_code}    200