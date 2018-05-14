# Sight Music Lab

A sight reading application, specifically designed for people learning to sight-sing in mind.

The application displays short sight-reading musical exercises. The user can record themself singing or performing the exercise through the application or upload an audio file. The application processes the audio of their performance and then displays the musical notation of what the user sang below the original exercise. It also displays a score of their performance and an embedded audio element for them to play back their recording.

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

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Built With

* [Sonic API](http://www.sonicapi.com) - The web api used to perform music processing and music analysis.
* [abcJS](https://github.com/paulrosen/abcjs) - The javascript library used for rendering musical notation

## Contributing

This application is a work in progress, and I encourage pull requests and issues on with your insights on how it can be improved. 

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc

