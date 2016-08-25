var http = require('http')
http.createServer(function  (req, res) {
    debugger;
    var foo = 5 > 7 ? 'bar' : 'foo';
    res.write(foo);
    res.end();
}).listen(3000);
