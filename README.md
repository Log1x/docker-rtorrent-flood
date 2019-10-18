# rTorrent + Flood Alpine Docker Image

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/log1x/rtorrent-flood?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/log1x/rtorrent-flood?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/log1x/rtorrent-flood?style=flat-square)

Want a barebones rTorrent + Flood container that works?

## Usage

```bash
$ docker run -d \
  -p 3000:3000 \
  -p 49184:49184 \
  -p 49184:49184/udp \
  -v <path for data files>:/data \
  -v <path for config files>:/config \
  log1x/rtorrent-flood
```

### Web UI

- **Flood (Web UI):** `http://<host>:3000`
- **Unix Socket**: `/tmp/.rtorrent.sock`

### Directory Structure

```bash
├── config/              # Configuration
│   ├── db/              # Flood DB  
│   ├── ssl/             # Self-signed SSL Certs
│   ├── rtorrent.rc      # rTorrent Configuration
│   ├── flood.js         # Flood Configuration
│   └── supervisord.conf # Supervisor Configuration
└── data/                # Downloads
    ├── .session         # Sessions
    └── .watch           # Watched Folder
```

### unRAID

Add the following template repository to unRAID:

```sh
https://github.com/log1x/docker-templates
```

## Bug Reports

If you discover a bug in docker-rtorrent-flood, please [open an issue](https://github.com/log1x/docker-rtorrent-flood/issues).

## Contributing

Contributing whether it be through PRs, reporting an issue, or suggesting an idea is encouraged and appreciated.

## License

docker-rtorrent-flood is provided under the [MIT License](https://github.com/log1x/docker-rtorrent-flood/blob/master/LICENSE.md).
