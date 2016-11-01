# Hdxir


This is a small app that uses [HandsetDetection](https://github.com/HandsetDetection/python-apikit) to detect the device specs and return them as JSON. 

To start the app:

  * Install dependencies with `mix deps.get`
  * Install Python and these libraries `tornado`, `dogpile.cache`, `PyYAML`
  * Install `python-apikit` using `git` to checkout the code.
  * Install the device database `hd.installArchive('hd.zip')`
  * Configure `HandsetDetection` by editing `hd_config.yml` (you will need an registered account)
    * Don't use caching - the app has cache of its own
    * set `use_local: True`
    * put `hd_config.yml` in the root of the app 
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

