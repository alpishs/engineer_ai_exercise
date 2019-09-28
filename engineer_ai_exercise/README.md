Below functionalities has been integrated into Application:

* Create a clean ruby on rails application using twitter bootstrap.   
* Create User model with fields first, last, email.   
* Install and setup devise gem to use the User model for auth (email used as a user name).   
* Generate devise views via rake command   
* On the register new user view add a new text field called Secret Code.   
* Restrict user registration so a hard coded secret code must be entered, eg. 'foobar'.   
* Create a new user with seeds called 'admin'   
* Create a controller/model SecretCode (1-to-1 relationship to Users which can be null, plus code string and usual created/updated).   
* The controller needs to provide a view and actions to generate a number of secret codes.   
* Index page shows secret codes available, and the associated user email address for ones that have an association.   
* Index page also has a button to generate more secret code models which by default have no associated user and a randomly generated secret code (some short hash or guid).   
* The index page also has a drop down filled with 1, 10, 20, 50, 100 which determines how many secret codes to generate (default selection on drop down is 10).   
* link secret code field on user registration page to only allow available secret code models (one with no current user associated).   
* registering a user will create association between user and the valid secret code they used.   
* secret code index page should show user email address for a secret code after they use it for registration in a table next to the code.   
* setup CanCan ACL gem.   
* create a role called :admin and manually in DB associate it with the admin user created manually earlier (no UI needed for this config).   
* configure so that SecretCode page link and entire controller is only accessible to :admin role users. 



How to Run this Application:

First way: 

I have already deployed this Application to heroku and can be access with this URL: https://engineerai.herokuapp.com/ and already run seeds over heroku so in order to Login via admin use below credentials:

Email: alpishs@yahoo.com
password: (Please check email for password)

-------------------------------------------

Second way:

1. Clone the repo to your local machine: git clone https://github.com/alpishs/engineer_ai_exercise.git
2. Now run Bundle Install (Note: Rails Version: Rails 6.0.0 & Ruby Version: ruby 2.6.2p47
3. Now run rails db:create
4. Now run rails db:migrate
5. Now run rails db:seed (Creating one user with admin role: email: alpishs@yahoo.com & password: (Please check email for password or go into seeds file)
6. Start your server

You're all set to play with the Application!!!!!!!


