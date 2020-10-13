"use strict";

const { Block } = require("spartan-gold");

module.exports = class UtxoBlock extends Block {

  /**
	 * Accepts a new transaction if it is valid and adds it to the block. Note
	 * that nonces don't matter for the UTXO model.
	 * 
	 * In the UTXO model, inputs must equal outputs (including the transaction
	 * fee). Any additional gold from the inputs must be sent to a 'change
	 * address', which should be generated by the client.
	 * 
	 * @param {Transaction}
	 *          tx - The transaction to add to the block.
	 * @param {Client}
	 *          [client] - A client object, for logging useful messages.
	 * 
	 * @returns {Boolean} - True if the transaction was added successfully.
	 */
  addTransaction(tx, client) {
    if (this.transactions.get(tx.id)) {
      if (client) client.log(`Duplicate transaction ${tx.id}.`);
      return false;
    } else if (tx.sig === undefined) {
      if (client) client.log(`Unsigned transaction ${tx.id}.`);
      return false;
    } else if (!tx.validSignature()) {
      if (client) client.log(`Invalid signature for transaction ${tx.id}.`);
      return false;
    } else if (tx.totalInput(this) !== tx.totalOutput()) {
      let input = tx.totalInput(this);
      let output = tx.totalOutput();
      if (client) client.log(`Inputs do not match outputs for transaction ${tx.id}: ${input} in, but ${output} out.`);
      return false;
    }

    // If the transaction is valid, add it to the block, delete
    // all accounts used as inputs from the current balances, and update
    // the balances of the accounts receiving the gold.
    //
    // If everything succeeds, return 'true'

    //
    // **YOUR CODE HERE**
    //
    
    //If the transaction is valid, add it to the block
    this.transactions.set(tx.id, tx);
    
    //delete all accounts used as inputs from the current balances
    for(let k in tx.from){
    	this.balances.delete(tx.from[k]);
    	console.log("**Deleting "+tx.from[k]);
    }
    console.log();
    
    //update the balances of the accounts receiving the gold.
    for(let k in tx.outputs){
    	this.balances.set(tx.outputs[k].address, tx.outputs[k].amount);
    	console.log("***Giving "+tx.outputs[k].amount+" to "+tx.outputs[k].address);
    }
    
    for(let k in this.balances){
    	console.log(this.balances[k]);
    }
    
    return true;
  }
}





























