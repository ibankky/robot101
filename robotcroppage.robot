*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${browser}    chrome
${url}    https://newrelic.com/
${user_name}      ******
${password}      *******
${id-block}     app_response
${project}      BigC SPO

*** Keywords ***
เปิดเว็บ
    Open Browser     ${url}     ${browser}
Login
    Click Element    //*[@id="desk-login"]
     Sleep    1s   
    Input Text       name=login[email]      ${user_name}
    Click Button     //*[@id="login_submit"]
    Sleep   1s
    Input Text      //*[@id="login_password"]   ${password}
    Click Button     //*[@id="login_submit"]
    Sleep   5s
Click Select
    Click Link       link=${project}
    Sleep   5s
Click Select time
    Click Element       //*[@id="time_window_nav"]/h4
    Click Element       //*[@id="time_window_ranges"]/li[2]/a  
    Sleep   5s     
Capture & Crop Screen
    Set Screenshot Directory  /Users/nanattapong/Robot101/Capture
    Capture Element Screenshot  ID=app_response  newrelic-Check{index}.png
    
*** Test Cases ***
ทดสอบ robot101

    เปิดเว็บ
    Login
    Click Select
    Click Select time
    Capture & Crop Screen
