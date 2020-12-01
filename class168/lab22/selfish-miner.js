"use strict";

const { Miner, Blockchain } = require('spartan-gold');

module.exports = class SelfishMiner extends Miner {

  constructor(...args) {
    super(...args);
    this.greedyMode = true;
  }

  /**
   * A selfish miner announces a proof only when the rest
   * of the mining network has caught up.
   */
  announceProof() {
    //
    // ***YOUR CODE HERE***
    //
  	
  	//In greedy mode, nothing needs to be done
  	if (this.greedyMode === false) {
  		//Otherwise, call `super.announceProof()` to share the proof as per normal operation
      super.announceProof();
    }
  }

  /**
   * When selfish miners receive a block, they check to see if the rest of
   * the network is catching up.  If so, the selfish miners share their
   * secret blocks.
   * 
   * In our version, the selfish miner will no longer be selfish once the rest
   * of the network has caught up.
   */
  receiveBlock(block) {
    block = Blockchain.deserializeBlock(block);
    super.receiveBlock(block);

    if (block.rewardAddr === this.address || this.greedyMode !== true) return block;

    //
    // ***YOUR CODE HERE***
    //
    // If the other miners are close to catching up, announce the most recent block.
    
    //If the incoming block has a 'chainLength' within a few blocks of the selfish miner's most recent block (this.lastBlock),
    if (block.chainLength - this.lastBlock.chainLength < 2) {
    	
    	//announce the miner's most recent block. 
      this.lastBlock.announceProof();
      
      //set greedyMode to false and stop the selfish mining attack.
      this.greedyMode = false;
    }
  }
}