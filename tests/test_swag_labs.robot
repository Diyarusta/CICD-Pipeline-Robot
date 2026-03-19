*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://diyarusta.github.io/CICD-Pipeline-Robot/swag_labs.html
${BROWSER}         Chrome
${USERNAME}        standard_user
${PASSWORD}        secret_sauce

*** Test Cases ***
Complete Purchase Flow

    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")    
    Maximize Browser Window
    Input Text   id:username    ${USERNAME}
    Input Text   id:password     ${PASSWORD}
    Click Button   id:login-button

    Sleep   1s

    Wait Until Element Is Visible   class:products-grid

    Click Button   xpath:/html/body/div[2]/div[2]/div[1]/button
    Click Button   xpath:/html/body/div[2]/div[2]/div[2]/button

    Click Element   class:cart-icon
    Wait Until Element Is Visible   xpath:/html/body/div[3]/h2

    Sleep   1s

    Click Button   xpath:/html/body/div[3]/div[1]/div[2]/button

    Sleep   1s

    Wait Until Element Is Visible   id:first-name

    Input Text   id:first-name   Diyar
    Input Text   id:last-name   Usta
    Input Text   id:postal-code   77652

    Click Button   xpath:/html/body/div[3]/div[2]/button

    Sleep   1s

    Wait Until Element Is Visible   xpath:/html/body/div[4]/h2

    Sleep   1s

    Click Button   xpath:/html/body/div[4]/button

    Close Browser