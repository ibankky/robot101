*** Settings ***
Library    Selenium2Library


*** Variables ***
${browser}    chrome
${url}    http://localhost:5000/
${searchData}     น้ำดื่ม
${user_name}      finch255@hotmail.com
${password}      12345678
${expected_result}      ทำรายการเสร็จสิ้น!


*** Keywords ***
เปิดเว็บBigc
    Open Browser     ${url}     ${browser}

ค้นหา น้ำ
    Input Text     ID=search-id    ${searchData}
    Press Keys     ID=search-id    ENTER
คลิ๊ก Login
    Click Link     link=เข้าสู่ระบบ  
Input Login
    Input Text     ID=emailLogin        ${user_name}    
    Input Text     ID=passwordLogin      ${password}   
    Click Button     ID=btn-login 
รอโหลด
    Sleep    10s   
รอผลลัพธ์
    Wait Until Page Contains    ${searchData}
คลิ๊กปิดblackdrop      
    Click button  //*[@id="header"]/div[1]/div/div[2]/div/div/button
กดเพิ่มสินค้า
    Click Element  //*[@id="product-list"]/div[3]/div[2]/div[1]/div[1]/div[1]/div[1]/div/div[2]/button
ไปหน้าcart
    Go To   http://localhost:5000/cart
คลิ๊กไป step1
    Click Link      link=ดำเนินการสั่งซื้อ
คลิ๊กไป step2
    Click Link      link=ดำเนินการต่อ
เลือก timeslot
    Click Element   //*[@id="__layout"]/div/div[2]/div[3]/div/div[1]/div[2]/div[6]/div[2]/div/div[7]
    Click Link      link=ดำเนินการต่อ
เลือก payment
    Click Element   //*[@id="__layout"]/div/div[2]/div[2]/div/div[1]/div/div[1]     
    Click Link      link=ดำเนินการต่อ
ConFirm
    Click Element      //*[@id="__layout"]/div/div[2]/div[2]/div/div[2]/div[2]/button
    Sleep    20s 
Order สำเร็จ
    Wait Until Page Contains    ${expected_result}
    Set Screenshot Directory  /Users/nanattapong/Robot101/success
    Capture Page Screenshot                
*** Test Cases ***
ทดสอบ robot101
   เปิดเว็บBigc
   คลิ๊ก Login
   Input Login
   รอโหลด
   ค้นหา น้ำ
   รอโหลด
   รอผลลัพธ์
   คลิ๊กปิดblackdrop 
   กดเพิ่มสินค้า
   ไปหน้าcart
   รอโหลด
   คลิ๊กไป step1
   รอโหลด
   คลิ๊กไป step2
   รอโหลด
   เลือก timeslot
   รอโหลด
   เลือก payment
   รอโหลด
   ConFirm
   Order สำเร็จ
   