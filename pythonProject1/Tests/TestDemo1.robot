*** Settings ***
Documentation    Login Details for Rahul Shetty
Library      SeleniumLibrary
Test Teardown    Close Browser

#Resource

*** Variables ***
${Error_Message_Login}        css:.alert-danger



*** Test Cases ***

Validate unsuccessful Login
    open the browser with the mortgage payment url
     Fill the login form
     wait until it checks and display error message
     verify error message is correct
#
*** Keywords ***
open the browser with the mortgage payment url
    #Create Webdriver       Chrome     executable_path= "C:\Users\User\AppData\Local\Programs\Python\Python310\Scripts\chromedriver.exe"
     Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
     #Maximize Browser Window
     #Sleep    5s
    #click element    xpath://*[contains(text(),'Login')]

Fill the login form
    Input Text       id:username      anum.zargar1100@gmail.com
    Input Password   id:password      Anum@1234
    Click Button        signInBtn
    Sleep    5s
    Close Browser
    
wait until it checks and display error message
      Wait Until Element Is Visible         ${Error_Message_Login}
      
verify error message is correct
       ${result}=    Get Text      css:.alert-danger
       Should Be Equal As Strings    ${result}     Incorrect username/password
      
