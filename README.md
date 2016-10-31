# Webmachine HAL/JSON API Demo

This is a simple Ruby application that shows how to use [Webmachine](https://github.com/seancribbs/webmachine-ruby), [HAL/JSON](http://blog.stateless.co/post/13296666138/json-linking-with-hal) and [Cucumber](https://cucumber.io) together.

## Getting Started

**1. Clone this repository:**

```bash
$ git clone https://github.com/tbalthazar/???.git
``` 

**2. Change directory to `???` and run the bootstrap script:**

It will install the required gems, create a SQLite database in `db/database.db` and seed the database with sample data.

```bash
$ cd ???
$ script/bootstrap
``` 

**3. Run the app:**

```bash
$ script/run
``` 

**4. Run the client:**

```bash
$ ruby client.rb help
$ ruby client.rb categories list
$ ruby client.rb categories new
$ ...
``` 

## Tests

You can run the tests using:

```bash
$ script/test
```

## License

Please see [LICENSE](/LICENSE) for licensing details. 
