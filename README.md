# Hdxir


This is a small app that uses [HandsetDetection Python api kit](https://github.com/HandsetDetection/python-apikit) to detect the device specs and return them as JSON.

To start the app:

  * Install dependencies with `mix deps.get`
  * Install Python and these libraries `tornado`, `dogpile.cache`, `PyYAML`
  * Install `python-apikit` using `git` to checkout the code.
  * Install the device database `hd.installArchive('hd.zip')`
  * Configure `HandsetDetection` by editing `hd_config.yml` (you will need a registered account)
    * rename `hd_config.yml.sample` to `hd_config.yml`, keep it in the root of the app
    * don't use caching - the app has cache of its own
    * set `use_local: True`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000/?ua=iPhone`](http://localhost:4000/?ua=iPhone) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

