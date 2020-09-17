"use strict";

const { Client, XFER } = require('./client.js');

const net = require('./fakeNet.js');


// If a cheater is detected, strict clients will delete
// the cheaters funds and refuse to accept any more transactions
// from them.
class StrictClient extends Client {
  punishCheater(name) {
    this.log(`Client ${name} is a cheater.  The wicked will be punished.`);
    delete this.ledger[name];
    delete this.clients[name];
  }
}

// Alice is the first client -- she starts with a special ledger.
let alice = new StrictClient('Alice', net);
alice.ledger = {
  'Alice': 800,
};
alice.clients = {
  'Alice': alice.keypair.public,
};

// Bob, Charlie, and Trudy join the network.
let bob = new StrictClient('Bob', net);
let charlie = new StrictClient('Charlie', net);
let trudy = new StrictClient('Trudy', net);

alice.showLedger();
bob.showLedger();
charlie.showLedger();
trudy.showLedger();
console.log();

// Alice gives funds to the others
alice.give('Bob', 150);
alice.give('Charlie', 75);
alice.give('Trudy', 250);
bob.give('Charlie', 15);

// Trudy joins the network.
alice.showLedger();
bob.showLedger();
charlie.showLedger();
trudy.showLedger();
console.log();

// Trudy give Bob some money, but only so that Bob is aware.
trudy.fakeGive = function(name, amount) {
  //
  // ***YOUR CODE HERE***
  //
  //transafer money
  let message = {"from":this.name,"to":name,"amount":amount};
  
  //sign message
  let sig = trudy.signObject(message);

  //send
  trudy.net.send('Bob', XFER, {message:message,signature:sig});
}

trudy.fakeGive('Bob', 150);

alice.showLedger();
bob.showLedger();
charlie.showLedger();
trudy.showLedger();
console.log();


bob.give('alice', 250);







