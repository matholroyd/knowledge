# Windows 10 Linux (Ubuntu) subsystem setup

[https://gorails.com/setup/windows/10](https://gorails.com/setup/windows/10) has pretty good instructions. 
Main thing I deviated on is to get Postgres running, instead of running from within the linux subsystem, 
I simply installed a working version via `chocolatey`.


## Additional tips to completing setup

When running `bundler` for the first time on a Rails project, will likely have to manually install some additional items.
Items I had to install were:

`gem install ruby_dep`
`sudo apt-get install libqt5webkit5-dev qt5-default` (needed for `capybara-webkit`)
    

### Postgres setup

Instead of setting up Postgres in the linux subsystem as the **gorails** guide suggests (if you want Postgres),
you can simply install Postgress via [chocolatey](https://chocolatey.org/). However, you still need to install the postgres dependencies for `ruby` + `rails` so e.g. `ActiveRecord` gem can connect to a Postgres server.


`sudo apt-get install postgresql-common libpq-dev`

To install the actual postgres server using `choco` use:

`choco install postgresql-9.3`
