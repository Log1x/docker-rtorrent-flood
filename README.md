# rTorrent + Flood Alpine Docker Image

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/log1x/rtorrent-flood?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/log1x/rtorrent-flood?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/log1x/rtorrent-flood?style=flat-square)

...

## Usage

```bash
$ docker run -d \
  --name=flood \
  -p 6600:6600 \
  -p 6680:6680 \
  -p 8000:8000 \
  -v <path for data files>:/data \
  -v <path for config files>:/config \
  log1x/rtorrent-flood
```

- **Iris (Web UI):** `http://<host>:6680`

## Bug Reports

If you discover a bug in docker-rtorrent-flood, please [open an issue](https://github.com/log1x/docker-rtorrent-flood/issues).

## Contributing

Contributing whether it be through PRs, reporting an issue, or suggesting an idea is encouraged and appreciated.

## License

docker-rtorrent-flood is provided under the [MIT License](https://github.com/log1x/docker-rtorrent-flood/blob/master/LICENSE.md).
