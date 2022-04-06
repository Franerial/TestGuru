## Description:
##### This application allows users to create and to pass tests. Users can manage tests with CRUD operations. All signed in users can pass any test of any user unlimited number of times. When the user completes the test, he will also receive an email notification with the results of passing. In addition, tests authors can manage answers for their tests (CRUD operations + mark answers as correct). Also users can create gists in their github profile on questions they are interested while passing the test, receive badges if the test has such rules and later view received badges in their profile. It is also possible to create tests with time limit and pass them with a timer

## Used technologies and gems:
*  Rails 6
*  Javascript & Jquery (timer for tests and progress bar for passing; sorting list of tests on root page)
*  Octokit (for creating gists)
*  Bootstrap
*  Pg (used PostgreSQL as the database for Active Record) 
*  I18n (english and russian localization)
*  Devise
*  Configured ActionMailer (sending test passage results to users email )

## List of entities:
*  User
*  Test
*  Question
*  Answer
*  Badge
*  Gist (Github)
