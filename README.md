AC Planner
========================

AC Planner is a site aimed at Animal Crossing New Horizons enthusiasts!

Here's a link to the [hosted site](https://ac-planner.herokuapp.com/) and here's a video [demo](https://www.youtube.com/watch?v=lEGqJHjB6ck)

This repo contains the files for setting up the databse for AC Planner. To effectively use this project for your personal user you will need an API key from [Nookipedia](https://nookipedia.com/api/). Once I have hosted the site on Heroku I will update this readme with a link to bypass the requirement of gathering an API key.

---

## Installation

1. Clone the repository
2. Navigate your terminal directory inside of the cloned repo
3. Run bundle install
4. Start [Postgres](https://postgresapp.com/downloads.html)
5. Run rails db:migrate
6. Set your API key to the rails environment by typing "export API_KEY=(your key)" in your terminal, followed by "ruby -e 'p ENV["API_KEY"]'"
7. Run rails db:seed (this will take some time)
8. Run rails s to start the local server
9. Set up the [frontend](https://github.com/123JackCole/acplanner_frontend)

---

## Starting the Application

Once everything is installed the pattern to open the site should be: 

1. Start Postgres
2. Run rails s on to start the backend
3. Run npm start on the frontend

---

## Technology Used

Ruby, 
ActiveRecord,
Rails,
Postgres,
Javascript,
React

---

## Contributing

This project gets its information from the [Nookipedia API](https://nookipedia.com/api/)

---

## Author

Jack Cole - [GitHub](https://github.com/123JackCole)

---

## License

This project is licensed under [MIT](https://en.wikipedia.org/wiki/MIT_License#References)

Copyright (c) <2020> <Jack Cole>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
