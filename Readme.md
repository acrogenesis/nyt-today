# nyt-today
Add high quality New York Times cover to remarkable using https://github.com/Evidlo/remarkable_news

## Deploy using heroku
https://devcenter.heroku.com/articles/container-registry-and-runtime
```sh
git clone git@github.com:acrogenesis/nyt-today.git
cd nyt-today
export DOCKER_DEFAULT_PLATFORM=linux/amd64
heroku container:login
heroku create
heroku container:push web
heroku container:release web
heroku open
# if it's not working check the Resources tab on heroku to see if web is running
```

## Test Locally
Install `imagemagick`
Install https://github.com/msoap/shell2http

```
shell2http -export-all-vars -cache=3600 /nyt ./entry.sh
open http://localhost:8080/nyt
```