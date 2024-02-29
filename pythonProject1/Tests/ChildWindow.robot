*** Settings ***
Documentation    Login Details for Rahul Shetty
Library      SeleniumLibrary
Test Setup    open the browser with the mortgage payment url
#Test Teardown    Close Browser session
Resource       resource.robot
Library        Collections
Library       String

#Resource

*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_Page_loads}                    css:.nav-link


*** Test Cases ***

Validate Child Window Functionality
    Select the link of child Window
    Verify the User is Switched to Child Window
    Grab the Email id in the Child Window
    Switch to Parent Window and enter email




*** Keywords ***
Select the link of child Window
    Click Element           css:.blinkingText
    Sleep            5


Verify the User is Switched to Child Window
    Switch Window      New
    Element Text Should Be     css:h1     DOCUMENTS REQUEST
    
    
Grab the Email id in the Child Window
 ${text} =  Get Text    css:.red
  @{words}= Split String  ${text}   at
    #0->Please email us
    #1->  mentor@rahulshettyacademy.com with below template to receive response
 ${text_spilt}=  Get From List     ${words}   1
 log ${text_Spilt}
 @{words_2}=  Split String   ${text_spilt}
 #0:mentor@rahulshettyacademy.com
 ${email}=  Get From List     ${words2}   0
 Set Global Variable  ${email}


Switch to Parent Window and enter email
    Switch Window     Main
    Title Should Be      LoginPage Practise | Rahul Shetty Academy
    Input Text      id:username      ${email}
    





   
    