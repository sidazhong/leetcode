"use strict";

const blindSignatures = require('blind-signatures');

const { Coin, COIN_RIS_LENGTH, IDENT_STR, BANK_STR, NUM_COINS_REQUIRED } = require('./coin.js');
const utils = require('./utils.js');

// This class represents a bank issuing DigiCash-lite coins.
class Bank {
  constructor() {
    this.key = blindSignatures.keyGeneration({ b: 2048 });
    this.ledger = {};
    this.coinDB = {}; // tracks previously redeemed coins
  }

  // Returns the modulus used for digital signatures.
  get n() {
    return this.key.keyPair.n.toString();
  }

  // Returns the e value used for digital signatures.
  get e() {
    return this.key.keyPair.e.toString();
  }

  // Prints out the balances for all of the bank's customers.
  showBalances() {
    console.log(JSON.stringify(this.ledger));
  }

  // Initializes a client's account with 0 value.
  registerClient(client) {
    this.ledger[client.name] = 0;
  }

  // Updates the ledger to account for money submitted directly to the bank.
  deposit({account, amount}) {
    if (this.ledger[account] === undefined) {
      throw new Error(`${account} is not a registered customer of the bank`);
    }
    this.ledger[account] += amount;
  }

  // Updates the ledger to account for money withdrawn directly from the bank.
  withdraw({account, amount}) {
    if (this.ledger[account] === undefined) {
      throw new Error(`${account} is not a registered customer of the bank`);
    }
    if (this.ledger[account] < amount) {
      throw new Error("Insufficient funds");
    }
    this.ledger[account] -= amount;
  }

  // Returns the balance for the specified account.
  balance(account) {
    if (this.ledger[account] === undefined) {
      throw new Error(`${account} is not a registered customer of the bank`);
    }
    return this.ledger[account];
  }

  // Transfers money between 2 of the bank's customers.
  transfer({from, to, amount}) {
    if (this.ledger[from] === undefined) {
      throw new Error(`${from} is not a registered customer of the bank`);
    }
    if (this.ledger[to] === undefined) {
      throw new Error(`${to} is not a registered customer of the bank`);
    }
    let fromBalance = this.ledger[from];
    if (fromBalance < amount) {
      throw new Error(`${from} does not have sufficient funds`);
    }
    this.ledger[from] = fromBalance - amount;
    this.ledger[to] += amount;
  }

  // Verifies that a bank customer has sufficient funds for a transaction.
  verifyFunds({account, amount}) {
    if (this.ledger[account] === undefined) {
      throw new Error(`${account} is not a registered customer of the bank`);
    }
    let balance = this.ledger[account];
    return balance >= amount;
  }

  // This method represents the bank's side of the exchange when a user buys a coin.
  sellCoin(account, amount, coinBlindedHashes, response) {
    //
    //  ***YOUR CODE HERE***
    //

    //1) Verify that the user prepared the right number of coins.
    if(coinBlindedHashes.length !== NUM_COINS_REQUIRED){
      throw new Error('Not the right number of coins.');
    }

    //2) Randomly select a coin.
    let selected = utils.randInt(coinBlindedHashes.length);

    //3) Call the 'response' callback function with the selected number.
    let rs = response(selected);

    //The bank should validate each of the 9 non-selected coins. Specifically, the bank should ensure:
    let blindingFactors = rs[0];
    let coins = rs[1];
    for(let k in coins){
      //1) The coin matches its blinding factor. 
      if(!coins[k].verifyUnblinded(blindingFactors[k])){
        throw new Error('The coin does not matches its blinding factor. ');
      }

      //2) That each pair of identity strings matches up with the purchaser's identity. (The leftIdent and rightIdent properties of the coin class are arrays that store this information).          
      for (let i = 0; i < COIN_RIS_LENGTH; i++) {
        let check =utils.decryptOTP({key:coins[k].leftIdent[i], ciphertext:coins[k].rightIdent[i], returnType:"string"});
        if(check !== "IDENT:"+account){
          throw new Error("can not match the purchaser's identity");
        }
      }
    }

    //If all coins seem valid, deduct money from the purchaser's account, sign the blinded hash, and return it to the user.
    this.withdraw({account:account, amount:amount});

    let signature = blindSignatures.sign({
        blinded: coinBlindedHashes[selected],
        key: this.key,
    });

    return signature;
  }

  // Adds a coin to a user's bank account.
  redeemCoin({account, coin, ris}) {
    //
    //  ***YOUR CODE HERE***
    //

    //verify that the coin has been signed by the bank
    let check_signature = blindSignatures.verify({
      unblinded: coin.signature,
      N: coin.n,
      E: coin.e,
      message: coin.toString(),
    });
    if(!check_signature){
      throw new Error('signature on the coin is invalid');
    }

    //verify the coin
    let coin_guid = coin.guid;
    let check_guid = this.coinDB[coin_guid];

    if(check_guid !== undefined){
      console.log("Coin "+coin.guid+" previously spent.  Determining cheater.");

      let cheater = undefined;
      for (let i = 0; i < COIN_RIS_LENGTH; i++) {
        let check_cheater = utils.decryptOTP({key:ris[i], ciphertext:check_guid[i], returnType:"string"});
        
        //If the coin purchaser cheated, print out the identity of the cheater. 
        if(check_cheater.includes("IDENT:")){
          cheater = check_cheater.replace('IDENT:','');
          console.log(cheater+" double spent coin "+coin.guid+".");
          break;
        }
      }

      if(cheater === undefined){
        console.log("The merchant tried to redeem the coin twice");
      }
        
      console.log("Sorry, but coin #"+coin.guid+" cannot be accepted.");
    }else{
      //If the coin has not been received previously, accept the coin and update the redeemer's balance.
      this.deposit({account:account, amount:coin.amount});

      //bank accept the coin
      this.coinDB[coin_guid] = ris;

      console.log("Coin #"+coin.guid+" has been redeemed.  Have a nice day.");
    }
  }
}

exports.Bank = Bank;





















