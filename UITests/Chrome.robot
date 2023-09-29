*** Settings ***
Library    SeleniumLibrary
Suite Setup     Go To Chrome    Chrome      C:/Users/DeLL/Desktop/SeleniumServer/chromedriver-win64/chromedriver.exe

*** Keywords ***
Go To Chrome
	[Arguments]    ${browser}    ${driver}
	Open Browser    browser=${browser}      executable_path=${driver}
	Go To  https://www.google.com
	sleep  2s
	Input Text    xpath://*[@id="APjFqb"]      teapot
	Wait Until Element Is Visible    //*[@id="jZ2SBf"]/div[@class='wM6W7d']/span
	Sleep    1s
	Click Element    //*[@id="jZ2SBf"]/div[@class='wM6W7d']/span
	Sleep    2s
	${teapot}=    Get Text    xpath://*[@id="APjFqb"]
	Should Be Equal As Strings    ${teapot}    teapot

*** Test Cases ***
First
	log     a message
