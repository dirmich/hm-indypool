const express = require('express')
const cors = require('cors')
const app = express()
const http = require('http')
const bodyParser = require('body-parser')
const routes = require('./route')
const PORT = 8080
app.use(cors())
const server = http.createServer(app)

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use('/',routes)

app.use( (req, res, next)=> {
    const err = new Error('Not Found')
    err.status = 401
    next(err)
  })
  
  server.listen(PORT, () => {
    console.log('Listen port ' + PORT)
  })
  server.on('error', onError)
  // server.on('listening', onListening);
  
  function onError(error) {
    if (error.syscall !== 'listen') {
      throw error
    }
  
    const bind = typeof port === 'string' ? 'Pipe ' + port : 'Port ' + port
  
    // handle specific listen errors with friendly messages
    switch (error.code) {
      case 'EACCES':
        console.error(bind + ' requires elevated privileges')
        process.exit(1)
      case 'EADDRINUSE':
        console.error(bind + ' is already in use')
        process.exit(1)
      default:
        throw error
    }
  }