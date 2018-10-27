"use strict";
const express = require('express');
const router = express.Router();

const Fs = require('fs');
const modelsPath = __dirname + "/../models/";

const serverSocket = require("../lib/serverSocket.js");

// Autoload of Models:
const models = {};
Fs.readdirSync(modelsPath)
.map(function(fName) {
    let mName = (fName.match(/(\w.*)\.js$/) || [])[1];
    if (mName) models[mName] = require(modelsPath + mName + ".js");
    return mName;
});



/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', models);
});


/* GET models client side */
router.get('/model/:model_id.json', function(req, res, next) {

    var model = models[req.params.model_id];

    if (model !== undefined) {
        res
            .status(200)
            .set('Content-Type', 'application/json')
            .send(model)
        ;
    } else {
        next();
    };

});

/* GET simple REST-WebSocket gateway */
router.get('/setslide/:msg', function(req, res, next) {

    serverSocket.broadcast(req.params.msg);

    res
        .status(200)
        .set('Content-Type', 'text/plain')
        .send("Ok")
    ;

});




module.exports = router;

