*** Variables ***
${add_toCart}                       xpath://*[@id="add-to-cart-button"]
${go_toCart}                        xpath://*[@id="sw-gtc"]/span
${go_toPayment}                     xpath://*[@id="sc-buy-box-ptc-button"]
${use_adress}                       xpath://*[@id="shipToThisAddressButton"]
${gift_textArea}                    xpath://div/textarea
${select_gift_checkbox}             xpath://*[@id="sc-buy-box-gift-checkbox"]
${use_gift_checkbox}                xpath://*[starts-with(@id, "gift-wrap-checkbox-")]
${select_creditCard}                xpath://*[starts-with(@id, 'pp-') and contains(@id, '-83')]
${order_alert}                      xpath://div[@aria-live='polite']/div/h4
${select_gift_goto_cardPayment}     xpath://span[@class='a-button a-button-primary chewbacca-enabled-save-gift-options-button primary-action-button']
${accept_paymentCard}               xpath://*[starts-with(@id, "pp-") and contains(@id, "-97")]/span
${products}                         xpath://span[@class='a-color-link clickable-heading']
${return_products_carts}            xpath://a[@href="https://www.amazon.com.tr/gp/cart/view.html/ref=chk_cart_link_return_to_cart"]
${delete_products}                  (//span[@data-feature-id="delete"]/span/input)
${product_names}                    xpath://span[@class="a-truncate-cut"]
${product_name}                     xpath://span[@id='productTitle']
${captured_text}
#Sonraki siparişinizde alışverişinizi tamamlarken doğrudan bu adıma geçerek zaman kazanmak ister misiniz?