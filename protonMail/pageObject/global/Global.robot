*** Variables ***

*** Keywords ***
user can see text
	[Arguments]     ${text}
    Element Should Be Visible          	                            dom=$("*:contains('${text}')")

user cannot see text
	[Arguments]     ${text}
    Element Should Not Be Visible                                   dom=$("*:contains('${text}')")

user can see button text
	[Arguments]     ${text}
    Page Should Contain Button                                      default=${text}

user cannot see button text
	[Arguments]     ${text}
    Page Should Not Contain Button                                  default=${text}

user click text
    [Arguments]     ${text}
    Click Element                                                   Link=${text}