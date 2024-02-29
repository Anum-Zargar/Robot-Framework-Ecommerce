*** Settings ***
Documentation    Login Details for Rahul Shetty
Library      SeleniumLibrary
Test Setup    open the browser with the mortgage payment url
#Test Teardown    Close Browser session
Resource       resource.robot
Library        Collections

#Resource

*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_Page_loads}                    css:.nav-link


*** Test Cases ***

#Validate successful Login
#    #open the browser with the mortgage payment url
#     Fill the login form         ${username}      ${invalid_password}
#     wait until it checks and display error message
#     verify error message is correct
#
#Validate card display in the shopping Page
#    Fill the login form        ${username}       ${valid_password}
#    Wait Until Element Is located in the page       ${Shop_Page_loads}
#    #Verify card Titles in the shop Page
#     Select the card           Blackberry


Select the form and navigate to Child Window
    Fill the login form and select User Option


*** Keywords ***
#open the browser with the mortgage payment url
    #Create Webdriver       Chrome     executable_path= "C:\Users\User\AppData\Local\Programs\Python\Python310\Scripts\chromedriver.exe"
    # Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
     #Maximize Browser Window
     #Sleep    5s
    #click element    xpath://*[contains(text(),'Login')]

Fill the login form
   [arguments]     ${username}       ${password}
    Input Text       id:username      ${username}
    Input Password   id:password      ${password}
    Click Button        signInBtn
    #Maximize Browser Window



wait until it checks and display error message
      Wait Until Element Is Visible         ${Error_Message_Login}
      
verify error message is correct
       ${result}=    Get Text      css:.alert-danger
       Should Be Equal As Strings    ${result}     Incorrect username/password
       
Wait Until Element Is located in the page
         [arguments]              ${element}
         Wait Until Element Is Visible          ${element}


Verify card Titles in the shop Page
 @{expectedListOfMobiles}=      Create  List    iphone X    Samsung Note 8      Nokia Edge     Blackberry
  #Log          "HI121"
 ${elements}=    Get WebElements                xpath://h4[@class='card-title']
 @{actuaLListofMobiles}=   Create  List

   FOR ${mobile1}   IN  @{elements}
        #Log          "HI12aaa1"
       Log    ${mobile1.text}
       append to list     ${actuaLListofMobiles}        ${mobile1.text}

    END

   Lists Should Be Equal      ${expectedListOfMobiles}   ${actuaLListofMobiles}
   

Select the card
    [Arguments]  ${cardName}
 ${elements} =    Get WebElements   css:card-title
 ${index} =   Set Variable  1
   FOR  ${element}  IN      ${elements}
     Exit For Loop If          '${cardName}' ==   '${element.text}'
      ${index}= Evalaute ${index} + 1

   END
   Click Button         xpath:(//*[@class='card-footer'])[4]/button

Fill the login form and select User Option
   #[arguments]      ${username}         ${password}
    Input Text       id:username      ${username}
    Input Password   id:password      ${valid_password}
    Click Element           xpath://input[@value='user']
     Wait Until Element Is Visible    css:.modal-body
     Click Button                okayBtn
     #Click Button                okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value        css:select.form-control             teach
    Select Checkbox      terms
    Checkbox Should Be Selected     terms
