var express = require('express')
, routes = require('./routes')
, http = require('http')
, path = require('path')
, socketio = require('socket.io')
, fs = require('fs')
, watch = require('node-watch');

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', routes.index);

var server = http.createServer(app);
var io = socketio.listen(server);

server.listen(app.get('port'), function(){

  console.log("Express server listening on port " + app.get('port'));

  io.sockets.on('connection', function (socket){

    console.log('Socket connected: ' + socket.id);

    watch('example.log', function(filename){

    fs.readFile('example.log', 'utf-8', function(error, data){
      if(error) throw error;

      var lines = data.trim().split('\n');
      var lastLine = lines.slice(-1)[0];

      console.log("Log file changed. Emitting " + lastLine);
        socket.emit('data', lastLine);
      });
    });
  });
});