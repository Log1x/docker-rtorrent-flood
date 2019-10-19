# rTorrent + Flood Alpine Docker Image

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/log1x/rtorrent-flood?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/log1x/rtorrent-flood?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/log1x/rtorrent-flood?style=flat-square)

Here's a performant, minimal, no-bullshit Alpine container for rTorrent & Flood.

Please be responsible and use a reverse proxy & authentication if you plan on exposing Flood and/or the nginx (rTorrent socket) instances outside of your network.

#### Features

* Based on Alpine Linux
* Uses the `edge` branch for latest releases
* Sane directory structure
* Sane default configuration
* Fully configurable
* Works without `tty: true`
* Flood actually connects to the Unix socket (first try!)
* Unix socket optionally available through nginx at `:3001` for Sonarr, Radarr, ...
* Auto-service restart on crash (supervisord)
* Automatically unpacks RAR releases
* unRAID template available

## Usage

```bash
$ docker run -d \
  -p 3000:3000 \
  -p 3001:3001 \
  -p 49184:49184 \
  -p 49184:49184/udp \
  -v <path for data files>:/data \
  -v <path for config files>:/config \
  log1x/rtorrent-flood
```

### Web UI

- **Flood (Web UI):** `http://<host>:3000`
- **rTorrent Unix Socket**: `/tmp/.rtorrent.sock`
- **rTorrent Socket Endpoint**: `http://<host>:3001`

### Directory Structure

```bash
├── config/              # Configuration
│   ├── db/              # Flood DB  
│   ├── rtorrent.rc      # rTorrent Configuration
│   ├── flood.js         # Flood Configuration
│   ├── nginx.conf       # nginx Configuration
│   └── supervisord.conf # Supervisor Configuration
├── data/                # Downloads
│   ├── .session         # Sessions
│   └── .watch           # Watched Folder
```

### unRAID

Add the following template repository to unRAID:

```bash
https://github.com/log1x/docker-templates
```

## Bug Reports

If you discover a bug in docker-rtorrent-flood, please [open an issue](https://github.com/log1x/docker-rtorrent-flood/issues).

## Contributing

Contributing whether it be through PRs, reporting an issue, or suggesting an idea is encouraged and appreciated.

## License

docker-rtorrent-flood is provided under the [MIT License](https://github.com/log1x/docker-rtorrent-flood/blob/master/LICENSE.md).
