module.exports = async () => {
    const http = require('http');
    const { createTerminus } = require('@godaddy/terminus');
    
    const healthCheckHandler = (req, res) => {
      res.writeHead(200);
      res.end('OK');
    };
    
    const server = http.createServer();
    
    createTerminus(server, {
      healthChecks: {
        '/health': healthCheckHandler,
      },
    });
    
    server.listen(1337); // Replace with the port your Strapi app is running on
  };
  