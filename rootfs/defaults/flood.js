const CONFIG = {
  baseURI: '/',
  dbCleanInterval: 1000 * 60 * 60,
  dbPath: '/config/db',
  floodServerPort: 3000,
  maxHistoryStates: 30,
  pollInterval: 1000 * 5,
  secret: 'tsunami',
  scgi: {
    host: 'localhost',
    port: 3001,
    socket: true,
    socketPath: '/tmp/.rtorrent.sock'
  },
  ssl: false,
  sslKey: '/config/ssl/key.pem',
  sslCert: '/config/ssl/cert.pem',
};

module.exports = CONFIG;
