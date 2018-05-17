# Sight Music Lab

A sight reading application, specifically designed for people learning to sight-sing in mind.

Displays short sight-reading musical exercises. A user can record themself singing or performing the exercise in the browser or upload an audio file. The application processes the audio of their performance to display the musical notation of their performance below the original exercise and a score out of ten on rhythmic and melodic accuracy.

This application uses SonicAPI (http://www.sonicapi.com/), a web api service that performs music processing and music analysis. After the user records themselves, the application sends a post request to SonicAPI's  '/analyze/melody' endpoint with an audio file of the user's recorded audio data.  The post request to this endpoint returns the midi-pitch, duration in seconds, onset time in seconds and normalized volume of each pitch in the audio file. 

The application uses abcjs (https://github.com/paulrosen/abcjs), a javascript library for rendering musical notation, and the MediaRecorder API to record audio in browser. The scoring is currently loosely based on the Colorado All-State choir audition scoring, as I initially developed the application with high school choir students in mind.

This application implements authentication through Google OAuth 2.0 

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

### Tested With
* [Capybara](https://github.com/teamcapybara/capybara)
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot)
* [webmock](https://github.com/bblimke/webmock)
* [vcr](https://github.com/vcr/vcr)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)

### Tests include: 

Feature tests

```
Give an example
```

Request tests
```
Give an example
```

Model Tests
```
Give an example
```

## Built With

* [Sonic API](http://www.sonicapi.com) - The web api used to perform music processing and music analysis.
   * The application sends a post request to SonicAPI's  '/analyze/melody' endpoint with an audio file of the user's recorded        audio data.
  * A post request to this endpoint returns the midi-pitch, duration in seconds, onset time in seconds and          normalized    volume of each pitch in the audio file.
  
* [abcJS](https://github.com/paulrosen/abcjs) - The javascript library used for rendering musical notation
* [mid-recorder-to-mp3](https://www.npmjs.com/package/mic-recorder-to-mp3) - The javascript library used to get an mp3 file                                                                                from a microphone audio recording
* [active_model_serializers](https://github.com/rails-api/active_model_serializers) - Used to serialize user's performances in                                                                                       the database
* [paperclip](https://github.com/thoughtbot/paperclip) - Used to store user audio recordings with Amazon Web Services                                                                  associated with a users' attempts

## Contributing

This application is a work in progress, and I encourage pull requests on how it can be improved. 

## Acknowledgments

* Inspired by [Colorado All-State Choir Audition Process](https://aschoir.com/auditions/) as I initially developed the application with high school choir students in mind

