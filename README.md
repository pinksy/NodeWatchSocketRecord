NodeWatchSocketRecord
=====================

NodeWatchSocketRecord is an example application, showing how you might watch a file (an Apache server log, for instance) for changes using Node.js (and Express.js for convenience), stream the last line to the browser with Socket.io, and record the data locally using the HTML5 FileSystem API. 

I have used yuanchuan's [node-watch] [1] module to watch for file changes. fs.readFile is used to read the file, splitting the data into an array seperated by \n, and slicing off the last element to get the last line - this is not optimal for large files, since fs.readFile reads the whole file. A better solution might be to use fs.createReadStream

The HTML5 FileSystem API may also not be best solution for recording the file - see [Why no FileSystem API in Firefox?] [2] 

[1]: https://npmjs.org/package/node-watch "node-watch"
[2]: https://hacks.mozilla.org/2012/07/why-no-filesystem-api-in-firefox "Why no FileSystem API in Firefox?"

Setup
-----

1. Open a command prompt in the root folder:
 
        npm install ejs  
        npm install express  
        npm install node-watch  
        npm install socket.io  
        node app  

2. Add some data to the end of example.log and save:

        {"type": "fruit", "name": "PINEAPPLE", "sales": 329}  
        {"type": "vegetable", "name": "BROCCOLI", "sales": 201}  

3.  See it in your browser console at [http://localhost:3000] [3]  
  [3]: http://localhost:3000    "http://localhost:3000"  
4.  If you're using Windows, run demo.vbs, and watch it go  

If you're using Chrome, I found the [HTML5 FileSystem Explorer] [4] extension quite handy...
[4]: https://chrome.google.com/webstore/detail/html5-filesystem-explorer/nhnjmpbdkieehidddbaeajffijockaea "HTML5 FileSystem Explorer"