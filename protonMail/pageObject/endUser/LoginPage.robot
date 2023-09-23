*** Settings ***
Resource                    ../global/Global.robot

*** Variable ***
${emailField}               id=username
${passwordField}            id=password
${signInButton}             xpath=//button[contains(@class,"button-large")][contains(text(),'Sign in')]
${emailMessage}             dom=$('.item-container-column')
${emailFbField}             id=email
${passwordFbField}          id=pass
${fbLoginButton}            name=login
${2faFieldFacebook}         id=approvals_code
${fbProfile}                xpath=//*[contains(@class,"x1n2onr6")][contains(text(),'Loraine')]

*** Keywords ***
user on the login page
    Go To                                   ${URL}
    Set Window Size                         1400    900

user input username and password
    [Arguments]     ${email}    ${password}
    Wait Until Element Is Visible              ${emailField}
    Input Text                                 ${emailField}        ${email}
    Set Global Variable                        ${emailLogin}        ${email}
    Input Text                                 ${passwordField}     ${password}

user click sign in button
    Wait Until Element Is Visible              ${signInButton}
    Click Element                              ${signInButton}

user can see proton dashboard
    Wait Until Element Is Visible              xpath=//*[contains(@class,"user-dropdown-email")][contains(text(),'${emailLogin}')]

user on the facebook login page
    Go To                                   ${FB URL}
    Set Window Size                         1400    900

user input facebook username and password
    [Arguments]     ${email}    ${password}
    Wait Until Element Is Visible              ${emailFbField}
    Input Text                                 ${emailFbField}        ${email}
    Set Global Variable                        ${emailLogin}          ${email}
    Input Text                                 ${passwordFbField}     ${password}

user click facebook sign in button
    Wait Until Element Is Visible              ${fbLoginButton}
    Click Element                              ${fbLoginButton}

user can see facebook home
    Wait Until Element Is Visible              ${fbProfile}

ehe
    conn = http.client.HTTPSConnection("api.practitest.com")
    payload = json.dumps({
      "data": {
        "type": "instances",
        "attributes": {
          "instance-id": 65117398,
          "exit-code": 0,
          "automated-execution-output": "THIS IS MY OUTPUT"
        }
      }
    })
    headers = {
      'Authorization': 'Basic bWVsdGVkY2hvY29fbW9jaGlAcHJvdG9uLm1lOjk4MmVjMDI0OWIwZTNhN2NjOWNkMDkwNTQyMmViNTEzZDFhNmIwMjI=',
      'Content-Type': 'application/json'
    }
    conn.request("POST", "/api/v2/projects/26027/runs.json", payload, headers)
    res = conn.getresponse()
    data = res.read()
    print(data.decode("utf-8"))

Post To API
    [Arguments]    ${url}=    https://api.practitest.com/api/v2/projects/26027/runs.json
    ${data}=    Create Dictionary    name=Failure
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    Post Request    ${url}    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200