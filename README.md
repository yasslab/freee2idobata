# RSS (freee) to Idobata

Bring notification in [freee feed](http://www.freee.co.jp/blog/feed) to [Idobata](http://idobata.io).

![Screenshot](https://raw.githubusercontent.com/yasulab/freee2idobata/master/freee2idobata.jpg)

## Requirements

- Heroku / Heroku Scheduler (add-on)
- ['idobata'](https://github.com/asonas/idobata-ruby) gem
- Idobata API Generic Hook

## How to setup

1. Set environment variables: 
    - `IDOBATA_END` for Idobata Generic Hook token
    - Command Example: `heroku config:add HIPCHAT_API_TOKEN=hogehogefoobar"`
2. `heroku create; git push heroku master`
3. `heroku addons:add scheduler`
4. Test: `heroku run bundle exec ruby hatebu2idobata.rb`
5. Add a job to [Heroku Scheduler](https://scheduler.heroku.com/dashboard)
   - Task: `bundle exec ruby hatebu2idobata.rb`
   - Dyno Size: `1x`
   - Frequency: `Hourly`
6. Done!

## License

Sample script to sign in Doorkeeper using Capybara

## License 

The MIT License (MIT)

Copyright &copy; 2014-2015 [YassLab](http://yasslab.jp)

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
