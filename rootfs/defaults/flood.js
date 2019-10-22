const CONFIG = {
  baseURI: '/',
  dbCleanInterval: 1000 * 60 * 60,
  dbPath: '/config/db',
  floodServerPort: 3000,
  maxHistoryStates: 30,
  pollInterval: 1000 * 5,
  secret: 'tsunami',
  scgi: {
    socket: true,
    socketPath: '/tmp/.rtorrent.sock'
  },
};

module.exports = CONFIG;
