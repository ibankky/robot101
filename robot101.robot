*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}    chrome
${url}    http://localhost:5000/
${expected_result}     น้ำ
${user_name}      finch255@hotmail.com
${password}      12345678

*** Keywords ***
เปิดเว็บBigc
    Open Browser     ${url}     ${browser}

ค้นหา น้ำ
    Input Text     ID=search-id    ${expected_result}
    Press Keys     ID=search-id    ENTER
คลิ๊ก Login
    Click Link     link=เข้าสู่ระบบ  
Input Login
    Input Text     ID=email        ${user_name}    
    Input Text     ID=passwordLogin      ${password}   
    Click Button     ID=btn-login 
รอโหลด
    Sleep    10s   
รอผลลัพธ์
    Wait Until Page Contains    ${expected_result}
คลิ๊กปิดblackdrop      
    Click button  //*[@id="header"]/div[1]/div/div[2]/div/div/button
กดเพิ่มสินค้า
    Click Element  //*[@id="product-list"]/div[3]/div[2]/div[1]/div[1]/div[1]/div[1]/div/div[2]/button    
ไปหน้าcart
    Go To   http://localhost:5000/
*** Test Cases ***
ทดสอบ robot101
   เปิดเว็บBigc
   คลิ๊ก Login
   Input Login
   รอโหลด
   ค้นหา น้ำ
   รอผลลัพธ์
   คลิ๊กปิดblackdrop 
   กดเพิ่มสินค้า
   รอผลลัพธ์
   ไปหน้าcart