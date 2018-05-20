# Sight Music Lab

A sight reading application, specifically designed for people learning to sight-sing in mind.

Displays short sight-reading musical exercises. A user can record themself singing or performing the exercise in the browser or upload an audio file. The application processes the audio of their performance to display the musical notation of their performance below the original exercise and a score out of ten on rhythmic and melodic accuracy.

## Deployed Application

This application is deployed through heroku. 
You can view the current production version of the application at [Sight Music Lab](https://sight-music-lab.herokuapp.com/)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

* Ruby 2+
* Rails 5+
* PostgreSQL

### Installing

Clone down this repository 
```
git clone https://github.com/annaroyer/sight_music_lab.git
```
Change into the project directory 
```
cd sight_music_lab
```
Install dependencies 
```
bundle install
```
Visit http://www.sonicapi.com, sign up for an account and register for a free API key.
Install figaro 
```
figaro install
```
Open application.yml 
```
open config/application.yml
```
* Enter ```SONIC_API_KEY: COPY YOUR API KEY HERE``` and save

Run rails server 
```
rails s
```
Visit localhost:3000 in your browser

## Running the tests

To run all tests ```rspec```

Tests include:
* feature specs
* request spec
* model specs

### Tested With
* [Capybara](https://github.com/teamcapybara/capybara)
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot)
* [webmock](https://github.com/bblimke/webmock)
* [vcr](https://github.com/vcr/vcr)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)

## Built With

* [Sonic API](http://www.sonicapi.com) - The web api used to perform music processing and music analysis.
   * The application sends a post request to SonicAPI's  '/analyze/melody' endpoint with an audio file of the user's recorded        audio data.
  * A post request to this endpoint returns the midi-pitch, duration in seconds, onset time in seconds and          normalized    volume of each pitch in the audio file.
  
* [abcJS](https://github.com/paulrosen/abcjs) - The javascript library used for rendering musical notation
* [mid-recorder-to-mp3](https://www.npmjs.com/package/mic-recorder-to-mp3) - The javascript library used to get an mp3 file                                                                                from a microphone audio recording

* [active_model_serializers](https://github.com/rails-api/active_model_serializers) - Used to serialize user's performances in                                                                                       the database
* [paperclip](https://github.com/thoughtbot/paperclip) - Used to store user audio recordings with Amazon Web Services                                                                  associated with a users' attempts

* [omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2) - Used to authenticate users via Google OAuth                                                                                   2.0

## Contributing

This application is a work in progress, and I encourage pull requests on how it can be improved. 

## Acknowledgments

* Inspired by [Colorado All-State Choir Audition Process](https://aschoir.com/auditions/) as I initially developed the application with high school choir students in mind

