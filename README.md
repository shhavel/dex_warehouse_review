# Warehouse Review

Rails app to generate a comparison report between warehouse locations CSV files and robot report JSON files.

For code formatting use [standard](https://github.com/standardrb/standard).

## App Setup

### System dependencies

The app is built with Ruby version 3.3.0, Rails 7.1.3, and PostgreSQL. For testing used Capybara and Selenium web driver.

### Installation

Install ruby gems:

~~~
bundle install
~~~

### Database setup

Create and migrate development and test databases:

~~~
rails db:setup
rails db:migrate
~~~

Database names and configurations are in `config/database.yml`

### Tests

Tu run tests:

~~~
rspec
~~~

## Start App Server

### Start development server

To start the server and CSS watcher run:

~~~
bin/dev
~~~

Or to start just a server providing a port:

~~~
rails server -p 3000
~~~

## Usage

### Upload a robot report

Files are uploaded to the app. Active Storage (part of Rails) is used for file management. In development mode files are stored in `./storage` folder. Configuration is in `config/storage.yml`.

Any of the previously uploaded robot files can be used for generating a comparison report. Files are shown in the form in order from newest to oldest.

Basic validation applied: app structure is not checked, as the valid standardised file is expected.

For development can upload a file via web form:

http://localhost:3000/robot_reports/new

For any integration please see example cURL requests (they are working ones as well for documentation purposes):

~~~sh
curl -i -X POST http://localhost:3000/robot_reports \
    -H "Accept: application/json" \
    -F 'robot_report[file]=@spec/fixtures/files/example-robot.json'
~~~

~~~sh
curl -i -X POST http://localhost:3000/robot_reports.json \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d @spec/fixtures/files/example-robot.json
~~~

### Generate a comparison report

Go to the root page: http://localhost:3000/, upload a CSV file (or select a previously uploaded file), select a robot file, and press `Compare` button to generate a comparison report.

To download a CSV file, a basic validation is performed: the existence of the file and its format are checked. No other validation is performed, as this seems reasonable for a user-specified application (AKA an internal application). Similarly, the exception handling is out of the scope of the task implementation.

The report is shown on the same page.

Also can download the report in CSV format, or XLSX format or copy the link that retrieves the same comparison report.

The app from the user perspective is basically a single-page app with the handy ability to copy a link to the report.

All locations in the report may have one of the three outcome summary status types (or categories): `ok`, `no_data` (not enough data to analyze), and `discrepancy`.

For convenience, the summary table is provided within the report with the number of locations of each status. Also, the table rows are highlighted in the appropriate color (green, yellow, and red, respectively).

| Outcome Status | Symbol | Category | Color | Severity |
|---|---|---|---|---|
| The location was empty, as expected | empty_empty | ok | green | info |
| The location was occupied by the expected items | item_ok | ok | green | info |
| Not Found | not_found | no_data | yellow | warning |
| Not successfully scanned | not_scanned | no_data | yellow | warning |
| The location was occupied, but no barcode could be identified | item_unidentified | no_data | yellow | warning |
| The location was occupied by an item, but should have been empty | empty_occupied | discrepancy | red | error |
| The location was empty, but it should have been occupied | item_missing | discrepancy | red | error |
| The location was occupied by the expected item and some other items | item_wrong | discrepancy | red | error |
| The location was occupied by the expected item and some other items | item_extra | discrepancy | red | error |
