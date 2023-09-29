*** Settings ***
Library    Selenium2Library
Resource   ../Resources/CommonVariables.robot
Library    String
Library    Collections

*** Keywords ***
Set Chrome Options
	[Documentation]
	...  This method sets chrome arguments

	${options}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
	FOR    ${option}   IN    @{chrome_arguments}
    Call Method    ${options}   add_argument    ${option}
    END
    [Return]    ${options}

HeadlessChrome
	[Documentation]
	...  This method create chrome webdriver with spesific arguments which we implement
	[Arguments]    ${url}

    ${chrome_options}=  Set Chrome Options
	Call Method    ${chrome_options}    add_experimental_option    detach     ${True}

    Create Webdriver    Chrome     options=${chrome_options}
	Go To    ${url}
	Maximize Browser Window
	Capture Page Screenshot

Click Element on page
    [Arguments]    ${element}
    ${status} =     Run keyword And Return Status    Wait Until Page Contains Element    ${element}    timeout=10   error=false
	Run Keyword If    ${status}    Click The Element    ${element}      10

Click Link Element ont the Page
	[Arguments]    ${element}
    Click the Link Element    ${element}    10

Check Element have text on the page
    [Arguments]    ${element}    ${timeout}     ${expected_text}
    Wait Element On The Page Untill Visible    ${element}    ${timeout}
	${status}    ${value}     Run Keyword And Ignore Error    Element Should Contain    ${element}     ${expected_text}
	Run Keyword If    '${status}'=='PASS'    Log To Console    \n${expected_text} Is Located on Page
	...     ELSE    Fail    \nERROR-${expected_text}-ERROR
    Capture Page Screenshot

Wait Element on the Page untill visible
	[Documentation]
	...    This method make sure element is on page
	[Arguments]    ${element}    ${timeout}
	Wait Until Keyword Succeeds       ${timeout}     2   Page Should Contain Element    ${element}

Click the Element
	[Documentation]
	...    This method make sure element is clicked

	[Arguments]       ${element}    ${timeout}

	Wait Until Keyword Succeeds       ${timeout}    2    Click Element    ${element}

Click the Link Element
	[Documentation]
	...    This method make sure link element is clicked

	[Arguments]       ${element}    ${timeout}
	Wait Until Keyword Succeeds       ${timeout}    2    Click Link    ${element}

Hover Mouse to Element on Page
	[Documentation]
	...  This method go and hover to element

	[Arguments]    ${element}
	Mouse Over     ${element}

Infinity Scroll Down
	[Documentation]
	...  This method you can scroll down to element in lazy load pages

	[Arguments]    ${element}
	FOR    ${i}   IN RANGE  6
    ${check}=   Element Should Be Visible    ${element}
    Log To Console    ${check}
    Exit For Loop If    ${check} != "None"
    Execute Javascript     window.scrollBy(0,1000)
    Scroll Element Into View    ${element}
    END

Click Checkbox
	[Arguments]    ${element}
#	${status}=    Run Keyword And Return Status        Element Should Be Visible    ${element}
    ${status} =     Run keyword And Return Status    Wait Until Page Contains Element    ${element}    timeout=10   error=false
	Run Keyword If    ${status}    Select Checkbox    ${element}

Check Input and Send Text
	[Arguments]    ${element}     ${text}
#	${status}=    Run Keyword And Return Status        Element Should Be Visible    ${element}
	${status} =     Run keyword And Return Status    Wait Until Page Contains Element    ${element}    timeout=10   error=false
	Run Keyword If    ${status}    Input Text     ${element}   ${text}

Get Input Text and Check
	[Arguments]    ${element}     ${text}
	${status} =     Run keyword And Return Status    Wait Until Page Contains Element    ${element}    timeout=10   error=false
	Run Keyword If    ${status}    Element Text Should Be     ${element}     ${text}

Get Text From Locator
    [Arguments]    ${element}
	${status} =     Run keyword And Return Status    Wait Until Page Contains Element    ${element}    timeout=10   error=false
	Run Keyword If    ${status}    Page Should Contain Element       ${element}
    ${captured_text}=     Get Text        ${element}
    [Return]   ${captured_text}


Select From List By Text
	[Arguments]    ${products}       ${text}
	${index}=    Set Variable    1
	@{shop_products}=    Get Webelements    ${products}
	FOR    ${product}  IN     @{shop_products}
        Log To Console      ${product.text}
        ${check}=   Run keyword And Return Status  Element Should Contain    ${product}      ${text}
        Exit For Loop If     ${check}==True
        ${index}=  Evaluate  ${index}+1
    END
    [Return]    ${index}

Select With Dynamic Xpath For Click
	[Arguments]    ${element}       ${index}
	${exact_location}=    Catenate    ${element}\[${index}]
	Click the Element     ${exact_location}       10