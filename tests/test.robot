*** Settings ***
Library           AppiumLibrary
Library           String
Library           Collections

*** Test Cases ***
Sample Test Case
    Comment    &{options}    Create Dictionary    androidPackage=com.android.chrome
    Comment    &{caps}    Create Dictionary    chromeOptions=${options}
    Comment    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=7.1    deviceName=emulator-5554    appPackage=com.android.chrome    appActivity=com.google.android.apps.chrome.Main
    Open Application    http://localhost:4723/wd/hub    platformName=%{DEVICEFARM_DEVICE_PLATFORM_NAME}    deviceName=%{DEVICEFARM_DEVICE_NAME}    androidPackage=com.android.chrome
    Comment    Create Webdriver    Remote    command_executor=http://localhost:4723/wd/hub    desired_capabilities=${caps}
    sleep    30
    Go To Url    https://www.ultimatix.net
    #Go To    https://www.ultimatix.net
    AppiumLibrary.Wait Until Element Is Visible    id=form1    30
    AppiumLibrary.Input Text    id=form1    1289939
    #truth in data
    Comment    Go To Url    https://stg.truthindata.tv/user/login
    Comment    AppiumLibrary.Wait Until Element Is Visible    id=edit-name    60
    Comment    AppiumLibrary.Input Text    id=edit-name    SPE_Automated_Testing
    Comment    AppiumLibrary.Input Text    id=edit-pass    6!jvd@ljy?n!8r
    Comment    AppiumLibrary.Click Element    id=edit-submit
    Comment    Close Application
