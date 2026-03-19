*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.saucedemo.com/
${BROWSER}         Edge
${USERNAME}        standard_user
${PASSWORD}        secret_sauce

*** Test Cases ***
Complete Purchase Flow
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text   id:user-name    ${USERNAME}
    Input Text   id:password     ${PASSWORD}
    Click Button   id:login-button

    Sleep   1s

    Wait Until Element Is Visible   class:inventory_list

    Click Button   id:add-to-cart-sauce-labs-backpack
    Click Button   id:add-to-cart-sauce-labs-bike-light

    Click Element   class:shopping_cart_link
    Wait Until Element Is Visible   class:cart_list

    Sleep   1s

    Click Button   id:remove-sauce-labs-bike-light

    Click Button   id:checkout

    Sleep   1s

    Wait Until Element Is Visible   id:first-name

    Input Text   id:first-name   Diyar
    Input Text   id:last-name   Usta
    Input Text   id:postal-code   77652

    Click Button   id:continue

    Sleep   1s

    Wait Until Element Is Visible   id:finish

    Sleep   1s

    Click Button   id:finish

    Wait Until Page Contains   Thank you for your order!

    Sleep   1s

    Close Browser