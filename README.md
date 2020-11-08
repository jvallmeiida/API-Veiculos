# API-VEICULOS
#### API-VEICULOS is an API to help you create, read, update and delete vehicles. Below are instructions on how to access endpoint. We have tests to make sure our API security is ok.

## Used technologies
##### * [Ruby]https://www.ruby-lang.org/pt/: version ruby 2.5.1p57
##### * [Rails]https://rubyonrails.org/: Rails 6.0.3.4
##### * [Rspec]https://rspec.info/: RSpec 3.10
&nbsp;
## Project Status
#####  The API was created specifically to acquire more knowledge and put theory into practice.
&nbsp;

## What you can do
  - show all veiculos ::: GET /api/veiculos(.:format)
  - show 1 veiculo :::  GET /api/veiculos/:id(.:format) 
  - Create veiculo ::: POST /api/veiculos(.:format)
  - update veiculo ::: PUT /api/veiculos/:id(.:format)
  - delete veiculo ::: DELETE /api/veiculos/:id(.:format)



## Installation
API-VEICULOS 
- requires [Ruby]https://www.ruby-lang.org/pt/
- requires [Rails]https://rubyonrails.org/
- requires [Rspec]https://rspec.info/
- requires [Postman]https://www.postman.com/

Run postman and start the server.

```sh
$ postman
$ cd Veiculos
$ rails S
```


## instructions for using the postman

After starting postman, make sure that "rails s" is running. Open postman and call your endpoint with the desired method.

## Tests

To run the tests with Rspec just run the command "bundle exec rspec spec", tested each method.



After that you can access at http://localhost:3000/