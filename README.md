# Webmachine HAL/JSON API Demo

This is a simple Ruby application that shows how to use [Webmachine](https://github.com/seancribbs/webmachine-ruby), [HAL/JSON](http://blog.stateless.co/post/13296666138/json-linking-with-hal) and [Cucumber](https://cucumber.io) together.

## Getting Started

**1. Clone this repository:**

```bash
$ git clone https://github.com/tbalthazar/webmachine-hal-json-api-demo.git
``` 

**2. Change directory to `webmachine-hal-json-api-demo` and run the bootstrap script:**

It will install the required gems, create a SQLite database in `db/database.db` and seed the database with sample data.

```bash
$ cd webmachine-hal-json-api-demo
$ script/bootstrap
``` 

**3. Run the server:**

```bash
$ script/run
``` 

**4. Run the client:**

Run the client in another terminal to connect to the server.

```bash
$ ruby client.rb login
$ ruby client.rb categories list
$ ruby client.rb categories new
``` 

Get help.

```bash
$ ruby client.rb help
``` 

## About the app

The app allows `Users` to manage `Articles` which belongs to a `Category`, and grant/revoke `Readers` access to those articles.

## Tests

You can run the tests using:

```bash
$ script/test
```

## License

Please see [LICENSE](/LICENSE) for licensing details. 
