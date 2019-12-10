#!/usr/bin/env node
const request = require('request');

var expectedWinner = "dev";
const votingUrl = "http://localhost/vote";
var topicsAdd = [ 'dev', 'ops'];

request.post(votingUrl, {
  json: {
    topics: topicsAdd
  }
}, (error, res, body) => {
  if (error) {
    console.error(error)
    return
  }
  console.log(`statusCode: ${res.statusCode}`)
  console.log(body)
});

request.put(votingUrl, {
    json: {
      topic: "dev"
    }
  }, (error, res, body) => {
    if (error) {
      console.error(error)
      return
    }
    console.log(`statusCode: ${res.statusCode}`)
    console.log(body)
  });

request.del(votingUrl, {
    headers: {
        'Content-Type': 'application/json'
    }
  }, (error, res, body) => {
    if (error) {
      console.error(error)
      return
    }
    console.log(`statusCode: ${res.statusCode}`)
    console.log(body);

    var resultWinner = JSON.parse(body);

    console.log(resultWinner["winner"]);

    if (expectedWinner == resultWinner["winner"]){
        process.exit(0);
    }else{
        process.exit(1);
    }

  });