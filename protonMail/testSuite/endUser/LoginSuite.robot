*** Settings ***
Resource    		../../config/${environment}.robot
Resource    		../../testScenario/endUser/LoginTest.robot
Suite Setup         Open Browser         https://www.google.com                ${BROWSER}
Suite Teardown       Run Keyword If Test Failed    Post To API
# Suite Teardown      Close Browser

*** Variables ***

*** Test Case ***
login to proton with valid credentials
    [Documentation]             valid login to proton application
    [Tags]                      regression      positive      function     general
    [Template]                  valid login to proton
    ${EMAIL}                    ${PASSWORD}
    ehe@ehe.com                 ehe

# login to facebook with valid credentials
#     [Documentation]             valid login to facebook application
#     [Tags]                      regression      positive      function     general
#     [Template]                  valid login to facebook
#     ${EMAIL}                    ${PASSWORD}