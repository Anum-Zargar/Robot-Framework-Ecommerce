*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library      SeleniumLibrary



*** Variables ***
${username}        rahulshettyacademy
${invalid_password}        123445
${valid_password}   learning
${url}          https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the mortgage payment url
    #Create Webdriver       Chrome     executable_path= "C:\Users\User\AppData\Local\Programs\Python\Python310\Scripts\chromedriver.exe"
     Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
     #Go To      ${url}         chrome
     
     
Close Browser session
    Close Browser
