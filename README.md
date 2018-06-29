# URL Shortener API web Server

This is a test task for MoneySmart company.

1. Provide a simple web front which will take URL input and give back a shortened URL
2. When user access the short URL it should be redirected to full URL
3. Provide an API endpoint where you can query stats around a particular shortened URL. The stats must include as much information as you can get out of the user who visited the shortened URL.  There is no right answer to this.   Please use your best judgement of what are important attributes to capture for this type of web application
4. Make small commits and make the commit messages descriptive so we can see your thought process
5. Provide unit tests and integration tests
6. User authentication is optional

-----------------------

I've decided to go with a Sinatra Web app, cause the scope of work seems to be quite small and the speed of Sinatra behind Thin server should be sufficient to provide blazing fast response time.

## Installation and first launch

If you are using RVM, I suggest to configure your working environment first: `echo '2.4.1' > .ruby-version && echo 'url_shortener_api' > .ruby-gemset` (Those files should be in your global gitignore).

1. `bundle`
2. `shotgun config.ru` (Shotgun allows app reload between subsequent requests, and Rack web server interface)

To run test, run `rspec`
