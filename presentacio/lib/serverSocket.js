// lib/serverSocket.js
// ===================
"use strict";

const Primus = require("primus");


const clients = {};

const services = {
    rpcResponse: function rpcResponseHandler(message) {//{{{
        const remote = this;
        if (message.requestId === undefined) {
            console.error("RPC response lacks request ID");
            return;
        };
        const request = remote.requests[message.requestId];
        request.error = message.error;
        request.response = message.response;
        request.status = "fullfilled";
    },//}}}
    log: function do_clientLog(message) { // Remote client logging facility.//{{{
        const remote = this;
        console.log(remote, message);
    },//}}}
};


function dataReceiver(message) {//{{{
    var remote = this;

    console.log(message);


    // if (
    //     (typeof message == "object")
    //     && message.service
    //     && services[message.service]
    // ) {
    //     services[message.service].call(remote, message);
    // } else console.error (
    //     "Unknown data received from " + remote.id + ":"
    //     , message
    // );

};//}}}


class Client {
    constructor(spark) {
        this.client = spark.headers['primus::req::backup'].client._peername;
        this.id = this.client.address + ":" + this.client.port;
        this.spark = spark;
        this.requests = {};
        clients[this.id] = this;

        spark.on('data', dataReceiver.bind(this));
        console.log ("New WebSocket connection from " + this.id);

    };
    sendMessage(data) {//{{{

        this.spark.write(data);

    };//}}}


};


module.exports = {
    init: function(server) {
        console.log("Initialising WebSocket service...");
        new Primus(
            server
            , {transformer: "engine.io"}
        ).on('connection', spark => new Client(spark));
    },
    broadcast: function(msg) {
        console.log ("Broadcast message:", msg);
        for (let cid in clients) {
            console.log ("Sending to ", cid);
            clients[cid].sendMessage(msg);
        };
    },
    api: {
        listClients: function listConnectedClients() {
            console.log (Object.keys(clients));

        },
        clients,
    },

};
