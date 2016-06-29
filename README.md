Oils of Joy (Sinatra Assessment)
A mock up of the future table relationships for the oils-of-joy.com website for my mother-in-law.

Features

User login/logout
User has many Products
Products have set types (Creams, Oils, Scrubs, Lip-Balms, and Sprays) for which to make a product
Products have many Oils AND Variants(size and cost)
User can view Product Lists, Oil Lists, and IF Admin can see Variants

How to run locally

Clone the repo
Navigate to the directory in your terminal
bundle install
rake db:migrate
rake db:seed
shotgun
Point your browser to http://localhost:9393
An admin user, in this case, was already created login: admin, password: admin

the admin will have access to the Variants new/edit/delete options
