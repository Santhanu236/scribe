# Scribe
* Scribe is a Blog web Application, built in Ruby on Rails (ROR).
* Scribe has all basic blog Operations, which works in the way of Social Media.
***
## User Registration:
* For user registration, User is asked for inputs like first name, last name, email, password, confirm password etc.
* All input fields are mandatory.
* First and Last name should be within 3 to 15 characters.
* Email should be in a proper email format, "@" is necessary.
* Password should contain about minimum of 8 characters.
* Password and confirm password should match.
* Password is stored in Hashed format in the database.

***
## User Login:
* User Login page contains two inputs namely email and password.
* Both fields are mandatory
* The Email should exist in the database , and the password for that email should match.
* This also has Forgot Password Feature in it.

***
## Forgot Password:
* User should enter their Email in the Email input field.
* The Email should be registered with the application.
* If the Email is registered, User recieves a 6 digit random OTP to their Registered Email.
* Users should enter the OTP, and If this OTP match , they are redirected to password reset Page.
* In password reset page, Users should fill Password and Confirm password fields to reset their password.

***
## Edit User Profile:
* Users can edit their Account fields like First name , last name, bio and also can edit their profile picture.

***
## Create Blogs:
* Users can create a new Blog and Post it.
* User is asked for the blog title, category, description, Blog content and also images for blog.
* The blogs are posted in the home page.

***
## Edit Blogs:
* Users can Edit their existing blog.
* Users are asked for the same inputs from create blogs page, filled with the old values and they can edit the blog and post it.

***
## Delete Blogs:
* Users can delete the blog, which is created by them.

***
## Like Blogs:
* Users can like a blog, and the like record is also maintained in the database.
***

## Comment Blogs:
* Users can add and Delete Comment for Blogs.
***
## Save Blogs:
* Users can save and add Blogs to their Blog Wishlist.
***
## Follow Feature:
* Users can follow other users, and also be followed by others.
***
## Search and Filter:
* Blogs can be searched with title keyword.
* Blogs can also be filtered by category too.

***
## Feedback:
* Users can write feedback to Scribe.
***
