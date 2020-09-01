"use strict";

let EventEmitter = require('events');

let net = require('./fakeNet.js');
let rand = require('./rand');
let crypto = require('crypto');

const SHARE = "SHARE_NUMBER";
const HASH = "HASH_NUMBER";

const HASH_ALG = 'sha256';

// Player for lottery game
class Player extends EventEmitter {
  constructor(name) {
    super();
    this.name = name;
    this.hash = [];
    this.shares = [];
    this.check = {};

    this.on(SHARE, this.handleShare);
    this.on(HASH, this.handleHash);
  }

  share() {
    let number = rand.nextInt(this.numPlayers);
    net.broadcast(SHARE, {id: this.id, number: number});
  }

  handleShare(o) {
    this.hash[o.id] = o.hash;
    let keys = Object.keys(this.hash);
    
    if (keys.length === this.numPlayers) {
    	this.emit("broadcast", o);
    }
  }
  
  handleHash(o){
  	this.shares[o.id] = o.number;
    let keys = Object.keys(this.shares);
    this.check[o.id] = {"number":o.number,"salt":o.salt};
    
    //Once all hashes are collected, broadcasts R, N
    if (keys.length === this.numPlayers) {
    	this.determineWinner();
    }
  }

  determineWinner() {
    let sum = 0;
    this.shares.forEach((share) => {
      sum += share;
    });
    
    let winnerID = sum % this.numPlayers;
    let winnerName = this.game.getPlayerName(winnerID);
    
    //verify
  	let verify_hash = crypto.createHash(HASH_ALG).update(this.check[winnerID].number + this.check[winnerID].salt).digest('hex');
  	if(verify_hash === this.hash[winnerID]){
    	console.log(`${this.name} announces ${winnerName} as the winner`);
    }else{
    	console.log("error");
    }
  }
  
  commit(){
  	//Once all hashes are collected, broadcasts R, N
  	this.on("broadcast", (o) => {
  		net.broadcast(HASH, {id: this.id, number: number, salt:salt});
    });
  	
  	//Selects a random number R and a nonce N
  	let salt = crypto.randomBytes(48).toString('hex');
  	let number = rand.nextInt(this.numPlayers);
  	let hash = crypto.createHash(HASH_ALG).update(number + salt).digest('hex');
  	
  	//Broadcasts hash (R,N)
  	net.broadcast(SHARE, {id: this.id, hash: hash});
  }
}


exports.Player = Player;

































