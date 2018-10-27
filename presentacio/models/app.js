// models/app.js
// =============
"use strict";
const Fs = require("fs");
const pkg = JSON.parse(Fs.readFileSync(__dirname + "/../package.json"));

module.exports = {
    name: pkg.name,
    longName: "Curs HTML5 EBAP",
    version: pkg.version,
};
