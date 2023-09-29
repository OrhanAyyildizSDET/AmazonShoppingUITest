*** Settings ***
Documentation    This is basic info suit
Library          Selenium2Library    timeout=0:00:10


*** Variables ***
${chrome}      C:/Users/DeLL/Desktop/SeleniumServer/chromedriver-win64/chromedriver.exe
${firefox}     C:/Users/DeLL/Desktop/SeleniumServer/firefoxdriver.exe
${edge}        C:/Users/DeLL/Desktop/SeleniumServer/chromedriver-win64/msedgedriver.exe

*** Test Cases ***
Should be able to add new customers
    [Documentation]    This is basic info test
    [Tags]             first
    Log                Test starting
    open browser       https://www.google.com     chrome
    Maximize Browser Window
    Sleep              2s

PlayAutomation Playground
	Log                Test starting
    open browser       https://automationplayground.com/crm    chrome
    Maximize Browser Window
    Click Link         id=SignIn
    Input Text         id=email-id        aa@aa.com
    Input Text         id=password        123
    Click Button       id=submit-id
    Log                Test completed
    Page Should Contain      Our Happy Customers
    Wait Until Element Is Visible     id=new-customer
    Click Link          id=new-customer
    Page Should Contain    Add Customer
    Select From List By Value   id=StateOrRegion   FL
    Select Radio Button    gender     male
    Select Checkbox     name=promos-name
    Click Element              xpath=//*[@href='customers.html']
    Sleep    2

*** Keywords ***


