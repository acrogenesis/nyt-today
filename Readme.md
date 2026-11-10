# nyt-today
Add high quality New York Times cover to remarkable using https://github.com/Evidlo/remarkable_news

`GET /nyt` returns today's front page (America/Chicago date) as a 1404x1872 JPEG, cached for an hour.

## Deployment

Production runs on a VPS behind a Cloudflare tunnel at `https://nyt-today.acrogenesis.com/nyt`.

- Checkout: `/root/web/nyt-today`, tools from `mise.toml` (shell2http, ImageMagick); Ghostscript from apt.
- `nyt-today.service` runs shell2http on `127.0.0.1:4004`.

Deploy the pushed `master` branch:

```sh
ssh root@<vps> 'bash /root/web/nyt-today/deploy/deploy.sh'
```

## Test Locally
Install [mise](https://mise.jdx.dev) and Ghostscript, then:

```sh
mise install
mise exec -- shell2http -cache=3600 /nyt ./nyt.sh
open http://localhost:8080/nyt
```
