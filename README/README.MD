# Functional Profile


## <u>Testing register and login scenarios</u>

Priority: 1

Estimation: 2

Pre-conditions: Must navigate to the home page

Description:  From the home page, the user attempts to register with both valid and unvalid details and attempts to login with both valid and unvalid login credentials.

|Step|Result|
|----|------|
|Prerequisite: Open browser and go to homepage (https://spartacus-demo.eastus.cloudapp.azure.com/electronics-spa/en/USD/)|You can see the homepage|
|Click on "Sign In / Register button"|You can see the Sign in page.|
|Click on the "Register" button|You  can see the register form|
|Input valid "Title", "First name", "Last name" fields with ("Mr", "Carlos", "Navarro"), input invalid "email", "password" and unmatching "Confirm password" fields with ("carlos@.com", "Passwrd", "Pass")|Alerts "This is not a valid email format", "This is not a valid password format", "password fields must match" are visible|
|Input valid "email", "password" and matching "Confirm password" fields with ("carlos.registered@gmail.com", "Passwrd!1", "Passwrd!1"), tick "terms and conditions" checkbox and click "Register" button|Login page is visible and message "Please login with valid credentials" appears.|
|click the "Sign In"  button|"This field is required" appears twice|
|Input valid "email" and invalid "password" with ("carlos.registered@gmail.com","Password")|"Please login with provided credentials" appears|
|Input unregistered "email" and valid "passsword" with ("carlos.unregistered@gmail.com","Password!1")|"Bad credentials. Please login again" appears|
|Click on "Forgot password?" and input valid "email" field with ("carlos.registered@gmail.com") and click "Submit" button|Reset password page appears and after clicking "Submit" message "An email has been sent to you with information on how to resset your passsword."|
|Input resgistered "email" and valid "passsword" with ("carlos.registered@gmail.com","Password!1")|Redirects  to homepage with usser logged in|


## <u>Browsing items checking for functionality and various functions</u>

Priority: 2

Estimation: 5

Pre-conditions: Must be logged in and navigate to the home page
    
Description:  Being logged in and from the home page, browse 3 items, checking for product detail page containing information in the "Product Details", "Specs", "Reviews" and "Shipping" sections. Write  review

|Step|Result|
|----|------|
|Prerequisite: Open browser go to homepage, login with valid credentials|You can see the homepapge with the user logged in|
|Hover over "BRANDS", select "Shop all brands", sort by "Price (Highest first)"|Item "DSLR-A900, body"  appears as the top hit amongst 176 results|
|select "DSLR-A900, body"|product detail page of "DSLR-A900, body" appears|
|Click  the "Product Details", "Specs", "Reviews" and "Shipping" sections in order|Relevant information appears below|
|Click on "Write A Review" button and input text on "Review Title, "Write your comments" and "Reviewer Name" with ("Solid camera", "Top end camera with excellent features", "Carlos"), click on 4/5 stars and click "Submit" button.|"Thank you for the review" text appears.|
|shrink browser to XXX dimensions|browser is resized and hamburger button appearss in the top navigation bar replacing the product categories|
|click on hamburger button on the left of the top navigation bar|drop down list with categories appears|
|click on "CAMCORDERS"| 6 results for camcorders appear|
|click the product layout button|item list appears in grid like formation|
|click on "Gigashot K80H"|product detail page of "Gigashot K80H" appears|
|click on "Add to Wish list"|"Add to Wish list" test turns into "Remove from Wish list"|
|maximise browser|browser is maximised|
|click on the top navigation serach bar and input "Straps"|drop  down list appears|
|select "Wide Strap for EOS 450D"|product detail page of "Wide Strap for EOS 450D" appears|



## <u>Placing an order of several items using manual and quick order methods</u>

Priority: 3

Estimation: 5

Pre-conditions: Must be logged in and navigate to the home page
    
Description:  Being logged in and from the home page, browse for 3 different items and add a varying number of units of each item to the cart. Add more items using the quick order method and a CSV file. Proceed to checkout, fill in shipping addres, method and payment details, checking for required fileds at each step and place order.

|Step|Result|
|----|------|
|Prerequisite: Open browser go to homepage, login with valid credentials|You can see the homepapge with the user logged in|
|click the serach bar in the top navigation bar and input "DSLR-A900, body"|item "DSLR-A900, body" appears|
|click on "Add To Cart" button next to item "DSLR-A900, body"|"Item(s) added to your cart"  text appears|
|click on the "X" button to continue browsing|search results appear with cart displaying 1 item|
|click the serach bar in the top navigation bar and input "Gigashot K80"|item "Gigashot K80" appears|
|click on "Add To Cart" button next to item "Gigashot K80"|"Item(s) added to your cart"  text appears|
|click the "+" sign"|"updating cart" messsage appears|
|click on the "X" button to continue browsing|search results appear wiith cart displaying 3 items|
|hover over the accesories dropdown menu in the top navigation bar|drop down menu appears|
|click on "tripods"| 8 results appear|
|click on the "chosi" filter under the "stores" section|7 results appear|
|click on the "Add To Cart" button for the item "Flexi-Tripod"|"Cart total (4 items)" text appears|
|click on the quantity field, and overwrite the quantity with "5" then click "View Cart"|shopping cart page loads displaying text "Your Shopping Cart" and 8 items in the cart|
|click on the "Quick Order" button unu the top navigation bar|Quick order page is loaded|
|click on "import products|a pop up appears with the message "Text file should contain list of products with required columns separated by comma: SKU and quantity."|
|click "Select File", manually select the "QuickOrder.csv" file and click "open"|text "QuickOrder.csv" appears|
|click the "Upload" button|"2 out of 2 products have been imported successfully." messsasge appears|
|click "Close" button|Quick order page is loaded|
|click  "Add To Cart"|cart displpaying 10 items|
|click the "Cart" icon|Your Shopping Cart page loaded, total amount is $10,088.82|
|click "Proceed to Checkout" button|Checkout page loads requesting Shiping address details|
|select "Spain" and "Mr." from the "Country/Region" and "Title" dropdowns| "Spain" and "Mr." text appear|
|fill in "First name", "Last name", "Address 1", "City", "Zip code" and "phone" fields with ("Carlos","Navarro", "Calle Buenavista 1", "Valencia", "46115", "156845928") and click the "Continue"  button| Shipping method selection appears|
|select "Premium Delivery" option| premium delivery option lights up|
|click on the "Continue" button| payment details inputs appear|
|Input the "Account Holder Name", "Card Number" and "Security code (CVV)" fields with ("Carlos Navarro", "1234567812345678", "123")|Corresponding text appears|
|select "Visa", "02" and "2025" from the "Payment Type" and Expiiration Date dropdown menus respectively and click the "Continue" button|ORDER  SUMMARY page appears|
|click the "I am confirming that I have read and agreed with the Terms & Conditions" checkbox and click the "Place Order" button|Order  Confirmation page appears with  correct details, cart dispplays 0 items|




## <u>Edit account details</u>

Priority: 4

Estimation: 2

Pre-conditions: Must be logged in and navigate to the home page

Description:  Being logged in and from the home page, delete a credit card payment method, add a new adress, edit email address.

|Step|Result|
|----|------|
|Prerequisite: Open browser go to homepage, login with valid credentials|You can see the homepapge with the user logged in|
|Hover  over "My Account"|drop down menu apppears|
|click "Payment Details"|payment details page loads|
|click on "delete" link and the "Delete" button| "New payment methods are added during checkout" is visible|
|Hover  over "My Account"|drop down menu apppears|
|click "Address Bookk"|Address Book page loads|
|click on "Add New Address"|Add a new shipping address text appears|
|select "Spain" and "Mr." from the "Country/Region" and "Title" dropdowns| "Spain" and "Mr." text appear|
|fill in "First name", "Last name", "Address 1", "City", "Zip code" and "phone" fields with ("Carlos","Navarro", "Calle Gran Via 15", "Valencia", "46008", "845958459") and click the "Add Address"  button| New address appears|
|Click on "Set as default" link|New address appearss ass default|
|Hover  over "My Account"|drop down menu apppears|
|click "Email Adress"|Update Email page loads|
|fill in "New email address", "Confirm new email address" and "Password" fields with ("carlos.newaddress@gmail.com","carlos.newaddress@gmail.com","Passwrd!1") and click "Save Button"|Login page laods with carlos.newaddress@gmail.com pre filled in the "Email address" field|
|fill in the "Password" field with "Passwrd!1" and click the "Sign In" button|  home page with usser logged in appears|


## <u>Return items</u>

Priority: 5

Estimation: 1

Pre-conditions: Must be logged in, an order must be in place and navigate to the home page

Desscription: Being logged in and having placed an order, from the order history page, return sseveral items from the order.

|Step|Result|
|----|------|
|Prerequisite: Open browser go to homepage, login with valid credentials, place an order, go to order history page|You can see the order history page|
|select the most recent order| order details are displayed|
|click on "Cancel Items" button|cancel order page loads|
|click on the "+" sign for item "EF 200mm f/2.8L II USM" and input 5  on the quanity field for item "Flexi-Tripod" and click on the "continue" button|selected items  with corressponding quatitiess are displayed|
|click on "Submit Ressquest" button| order apppear with "Cancel Pending" satus|

# Automation Profile

## Description

I selected the first three tests to automate, namely: "Testing register and login scenarios", "Browsing items checking for functionality and various functions" and "Placing an order of several items using manual and quick order methods".

To run the suite, open the file "pivotree-tecnical-test" in your IDE and making sure you are on the "C:\*\pivotree-tecnical-test" directory type the "robot -d results Tests/scenarios.robot" in the terminal to ensure that the results are savedd appropriately.