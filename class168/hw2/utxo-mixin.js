"use strict";

const { Blockchain, utils } = require('spartan-gold');

/**
 * Mixes in shared behavior between clients and miners for handling UTXO transactions.
 */
module.exports = {

  /**
   * In the UTXO model, a client should have a collection of addresses.
   * We refer to this collection as a "wallet".
   * 
   * In our design, the wallet will be a queue of addresses (first-in, first-out).
   * We represent this with an array.
   */
  setupWallet: function() {
    // A wallet has utxos of the form { address, keyPair }
    this.wallet = [];

    // Adding initial balance to wallet.
    this.wallet.push({ address: this.address, keyPair: this.keyPair });
  },

  /**
   * With the UTXO model, we must sum up all balances associated with
   * addresses in the wallet.
   */
  getConfirmedBalance: function() {
    // Go through all addresses and get the balances according to
    // the last confirmed block, then return the total.

    //
    // **YOUR CODE HERE**
    //

    let total = 0;
    //Go through all addresses
    for(let k in this.wallet){

      //get the balances according to the last confirmed block
      total += this.lastConfirmedBlock.balanceOf(this.wallet[k].address);
    }

    //then return the total.
    return total;
  },

  /**
   * Creates a new address/keypair combo and adds it to the wallet.
   * 
   * @returns Newly created address.
   */
  createAddress: function() {
    // Create a new keypair, derive the address from the public key,
    // add these details to the wallet, and return the address.

    //
    // **YOUR CODE HERE**
    //

    //reate a new keypair
    let kp = utils.generateKeypair();

    //derive the address from the public key
    let address = utils.calcAddress(kp.public);

    //add these details to the wallet
    let item = {"address":address,"keyPair":kp}
    this.wallet.push(item);

    //return the address.
    return address;
  },

  /**
   * Utility method that prints out a table of all UTXOs.
   * (That is, the amount of gold for all addresses that
   * have not yet been spent.)
   * 
   * This table also includes a "**TOTAL**" entry at the end
   * summing up the total amount of UTXOs.
   */
  showAllUtxos: function() {
    let table = [];
    this.wallet.forEach(({ address }) => {
      let amount = this.lastConfirmedBlock.balanceOf(address);
      table.push({ address: address, amount: amount });
    });
    table.push({ address: "***TOTAL***", amount: this.confirmedBalance });
    console.table(table);
  },

  /**
   * Broadcasts a transaction from the client giving gold to the clients
   * specified in 'outputs'. A transaction fee may be specified, which can
   * be more or less than the default value.
   * 
   * The method gathers sufficient UTXOs, starting with the oldest addresses
   * in the wallet.  If the amount of gold exceeds the amount needed, a
   * new "change address" is created, which will receive any additional coins.
   * 
   * @param {Array} outputs - The list of outputs of other addresses and
   *    amounts to pay.
   * @param {number} [fee] - The transaction fee reward to pay the miner.
   * 
   * @returns {Transaction} - The posted transaction.
   */
  postTransaction: function(outputs, fee=Blockchain.DEFAULT_TX_FEE) {

    // Calculate the total value of gold needed and make sure the client has sufficient gold.
    //
    // If they do, gather up UTXOs from the wallet (starting with the oldest) until the total
    // value of the UTXOs meets or exceeds the gold required.
    //
    // Determine by how much the collected UTXOs exceed the total needed.
    // Create a new address to receive this "change" and add it to the list of outputs.
    //
    // Call `Blockchain.makeTransaction`, noting that 'from' and 'pubKey' are arrays
    // instead of single values.  The nonce field is not needed, so set it to '0'.
    //
    // Once the transaction is created, sign it with all private keys for the UTXOs used.
    // The order that you call the 'sign' method must match the order of the from and pubKey fields.
  	//
  	// update the wallet 

    //
    // **YOUR CODE HERE**
    //
  	
  	// Calculate the total value of gold needed and make sure the client has sufficient gold.
  	let total_value = fee;
  	for(let k in outputs){
  		total_value += outputs[k]['amount'];
  	}
  	if(this.getConfirmedBalance() < total_value){
  		throw 'not sufficient balance';
  	}
  	
    // If they do, gather up UTXOs from the wallet (starting with the oldest) until the total
    // value of the UTXOs meets or exceeds the gold required.
  	let UTXOs = 0;
  	let from = [];
  	let pubKey = [];
  	let privateKey = [];
  	for(let k in this.wallet){
  		UTXOs += this.lastConfirmedBlock.balances.get(this.wallet[k].address);
  		from.push(this.wallet[k].address);
  		pubKey.push(this.wallet[k]['keyPair']['public']);
  		privateKey.push(this.wallet[k]['keyPair']['private']);
  		
  		//delete old wallet address
  		if(UTXOs >= total_value){
  			break;
  		}
  	}
  	
    // Determine by how much the collected UTXOs exceed the total needed.
    // Create a new address to receive this "change" and add it to the list of outputs.
  	let exceed = UTXOs - total_value;
  	let new_address = this.createAddress();
  	outputs.push({"amount":exceed,"address":new_address});
  	
  	// Call `Blockchain.makeTransaction`, noting that 'from' and 'pubKey' are arrays
    // instead of single values.  The nonce field is not needed, so set it to '0'.
    let tx = Blockchain.makeTransaction({
      from: from,
      nonce: 0,
      pubKey: pubKey,
      outputs: outputs,
      fee: fee,
    });
  	
    // Once the transaction is created, sign it with all private keys for the UTXOs used.
    // The order that you call the 'sign' method must match the order of the from and pubKey fields.
  	for(let k in privateKey){
  		tx.sign(privateKey[k]);
  		this.wallet.shift();
  	} 
  	
    // Adding transaction to pending.
    this.pendingOutgoingTransactions.set(tx.id, tx);

    this.net.broadcast(Blockchain.POST_TRANSACTION, tx);

    // If the client is a miner, add the transaction to the current block.
    if (this.addTransaction !== undefined) {
      this.addTransaction(tx);
    }
    
    return tx;
  }
}






















