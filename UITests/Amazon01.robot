*** Settings ***
Library             Selenium2Library
Resource            ../Keywords/AmazonKeywords.robot
#Suite Setup
#Suite Teardown      Close Browser

*** Test Cases ***
Tc01.User
	Open Browser and Amazon webpage
    Login to website
    Search for products and select the last product
    Add product to cart
    See the product in cart page
    Go back and remove products from cart

Tc02.Demo
	Log    Hello

Tc03.AmazonShopPage
	Open Browser     https://www.amazon.com.tr/gp/cart/view.html?ref_=nav_cart     Chrome
	Login to website
    Just remove products from cart
