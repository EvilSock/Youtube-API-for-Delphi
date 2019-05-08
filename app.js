
var jsonxml = require('jsontoxml');
var search = require('youtube-search');
var fetchVideoInfo = require('youtube-info');
var path = require('path');
fs = require('fs');


const express = require('express')
const app = express()

app.get('/', (req, res) => {
  if (req.query.search != null){
    var opts = {
        maxResults: 3,
        key: 'your api key'
      };
       
      // search(req.query.search, opts, function(err, results) {   results[0].id
      //   if(err) return console.log(err);
      //   var link = "";

      fetchVideoInfo(req.query.search, function (err, x) {
        if (err) throw new Error(err);

        console.log(x);
        x.description = 'nan';
        x.genre = x.genre.replace('&','and');
        x.title = x.title.replace('&','and');
        x.regionsAllowed = 'NAN';
        // var ns = s.replace('&','and');
        // x.title = ns;
        var xml = jsonxml(x);
    
        //make file and send

        xml = '<root>' + xml +'</root>';
        console.log(xml);
        fs.writeFile('data.xml', xml, function(err, data) {
          if (err) {
          console.log(err);
          }
          else {
          console.log('updated!');
          res.sendFile(path.join(__dirname + '/data.xml'));
          }
        });


    });
      
  }else{
    res.sendFile(path.join(__dirname + '/index.html'));
  }
})

app.listen(8080);





