*** Settings ***
Library    Selenium2Library


*** Variables ***
${browser}    chrome
${url}    http://www.bigc.co.th
${searchData}     พัดลม
${user_name}      ******
${password}      ******
${expected_result}      ทำรายการเสร็จสิ้น!


*** Keywords ***
เปิดเว็บBigc
    Open Browser     ${url}     ${browser}

ค้นหา น้ำ
    Input Text     //*[@id="header"]/div[1]/div/div[2]/div/div/form/input    ${searchData}
    Press Keys     //*[@id="header"]/div[1]/div/div[2]/div/div/form/input   ENTER
     Sleep    5s   
คลิ๊ก Login
    Click Link     link=เข้าสู่ระบบ  
Input Login
    Input Text     //*[@id="email"]        ${user_name}    
    Input Text     //*[@id="__BVID__147"]     ${password}   
    Click Button     //*[@id="login-modal___BV_modal_body_"]/div/div[2]/form/div[4]/div[1]/button
    Sleep    10s   
รอโหลด
    Sleep    10s   
รอผลลัพธ์
    Wait Until Page Contains    ${searchData}
คลิ๊กปิดblackdrop      
    Click button  //*[@id="header"]/div[1]/div/div[2]/div/div/button
กดเพิ่มสินค้า
    Click Element  //*[@id="product-list"]/div[3]/div[2]/div[1]/div[1]/div[1]/div[1]/div/div[2]/button
    Sleep    10s 
ไปหน้าcart
    Go To   http://www.bigc.co.th/cart
    Sleep    10s
กดเพิ่มสินค้าหน้าcart     
    Click Element   //*[@id="__layout"]/div/div[2]/div[2]/div[2]/div[1]/div/div[2]/div[3]/div/div[2]/button
      
คลิ๊กไป step1
    Click Link      link=ดำเนินการสั่งซื้อ
     Sleep    7s   
คลิ๊กไป step2
    Click Link      link=ดำเนินการต่อ
     Sleep    13s  
เลือก timeslot
    Click Element   //*[@id="__layout"]/div/div[2]/div[3]/div/div[1]/div[2]/div[7]/div[2]/div/div[7]
    Click Link      link=ดำเนินการต่อ
     Sleep    10s  
เลือก payment
    Click Element   //*[@id="__layout"]/div/div[2]/div[2]/div/div[1]/div/div[1]     
    Click Link      link=ดำเนินการต่อ
     Sleep    10s  
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
   ค้นหา น้ำ
   รอผลลัพธ์
   คลิ๊กปิดblackdrop 
   กดเพิ่มสินค้า
   ไปหน้าcart
   คลิ๊กไป step1
   คลิ๊กไป step2
   เลือก timeslot
   เลือก payment
   ConFirm
   Order สำเร็จ
   
