*** Settings ***
Library    Selenium2Library
Resource   ../Settings and Functions/Functions.robot
Resource   ../Resources/AmazonLoginVariables.robot
Resource    ../Resources/AmazonPages.robot
Resource    ../Resources/AmazonShopPage.robot


*** Keywords ***
Open Browser and Amazon webpage
	Functions.Firefox Browser                             ${amazon_url}
	Functions.Click Element on page                       ${amazon_cookies}
	Sleep    3

Login to website
    Functions.Hover Mouse to Element on Page              ${amazon_account}
    Functions.Click Element on page                       ${amazon_signin}
    Functions.Wait Element on the Page untill visible     ${amazon_username_input}   10
    Input Text                                            ${amazon_username_input}      ${amazon_username}
    Functions.Click Element on page                       ${amazon_continue_button}
    Functions.Wait Element on the Page untill visible     ${amazon_password_input}   10
    Input Text                                            ${amazon_password_input}      ${amazon_password}
    Functions.Click Element on page                       ${amazon_login_button}
    Functions.Check Element have text on the page         ${signin_check_byname}    20    Orhan
    Sleep    1

Search for products and select the last product
	Functions.Wait Element on the Page untill visible     ${search_input}   10
	Input Text                                            ${search_input}      rtx4070 laptop
	Functions.Click Element on page                       ${search_button}
	Functions.Infinity Scroll Down                        ${last_item_on_the_firstPage}
	Sleep    2
	Functions.Click Element on page                       ${last_item_on_the_firstPage}
	Sleep    2


Add product to cart
	${captured_text}=   Functions.Get Text From Locator   ${product_name}
    Set Global Variable    ${captured_text}
	Functions.Wait Element on the Page untill visible     ${add_toCart}     10
	Functions.Click Element on page                       ${add_toCart}
	Functions.Wait Element on the Page untill visible     ${go_toCart}      10
	Functions.Click Element on page                       ${go_toCart}
	Functions.Wait Element on the Page untill visible     ${go_toPayment}   10
	Functions.Click Checkbox                              ${select_gift_checkbox}
    Functions.Click Element on page                       ${go_toPayment}

See the product in cart page
	Functions.Wait Element on the Page untill visible     ${use_adress}     10
	Functions.Click Element on page                       ${use_adress}
	Sleep    10
	Functions.Check Input and Send Text                   ${gift_textArea}      Thanks a lot for your service
	Functions.Click Checkbox                              ${use_gift_checkbox}
	Functions.Click Element on page                       ${select_gift_goto_cardPayment}
	Sleep    10
	Functions.Wait Element on the Page untill visible     ${select_creditCard}     10
	Select Radio Button                                   ppw-instrumentRowSelection    instrumentId=0h_PE_CUS_63a584b4-5d70-4bd1-b35e-6546374c5c40&isExpired=false&paymentMethod=CC&tfxEligible=false
    Sleep    2
    Functions.Click Element on page                       ${accept_paymentCard}
    Sleep   10
    Functions.Get Input Text and Check                    ${order_alert}           Sonraki siparişinizde alışverişinizi tamamlarken doğrudan bu adıma geçerek zaman kazanmak ister misiniz?

Go back and remove products from cart
	Functions.Click Element on page                       ${products}
	Functions.Click Element on page                       ${return_products_carts}
	${index}=   Functions.Select From List By Text        ${product_names}       ${captured_text}
    Functions.Select With Dynamic Xpath For Click         ${delete_products}     ${index}

Just remove products from cart
	${index}=   Functions.Select From List By Text        ${product_names}       ${captured_text}
    Functions.Select With Dynamic Xpath For Click         ${delete_products}     ${index}
#	Functions.Select From List By Text
#End test
#	Close Browser

