# README

## Rails Engine

* An API for analyzing sales date

## Clone the Project

* In your teminal: ```git clone git@github.com:riverswb/rails_engine.git ```

* Get in the project: ``` cd rails_engine ```

## Setup

* In terminal: ```bundle install ```

* Download the CSV files into the db/csv folder from [here](https://github.com/turingschool-examples/sales_engine/tree/master/data)

* Prepare your Postgres Database with: ``` rake db:create db:migrate db:test:prepare ```

* Seed the database by running this in terminal: ``` rake import:all ```

## Check that setup was successful

* In your terminal: ``` rspec ```

* You should see a beautiful wall of green test names, if not check the setup steps
