"use strict";
const utils = require('./utils.js');

class Prover {
  constructor(numLeadingZeroes) {
    this.numLeadingZeroes = numLeadingZeroes;
  }

  verifyProof(s, proof) {
    //
    // ***YOUR CODE HERE***
    //

    //get hex hash
    let hex_check = utils.hash(s+proof);

    let count = 0;
    let array_check = Array.from(hex_check);

    for(let k in array_check){
      if(array_check[k]==='0'){
        count = count + 4;
        if(count === this.numLeadingZeroes){
          return true;
        }
      }
      else if(array_check[k]==='1' ){
        count = count + 3;
        if(count === this.numLeadingZeroes-3){
          return true;
        }else{
          return false;
        }
      }
      else if(array_check[k]==='2' || array_check[k]==='3'){
        count = count + 2;
        if(count === this.numLeadingZeroes-2){
          return true;
        }else{
          return false;
        }
      }
      else if(array_check[k]==='4' || array_check[k]==='5' || array_check[k]==='6' || array_check[k]==='7'){
        count = count + 1;
        if(count === this.numLeadingZeroes-1){
          return true;
        }else{
          return false;
        }
      }
      else{
        return false;
      }
    }

  }

  findProof(s) {
    //
    // ***YOUR CODE HERE***
    //
    let check = false;
    let nonce = 0;
    while(!check){
      if(this.verifyProof(s,nonce)){
        check = true;
        break;
      }
      else{
        nonce ++;
      }
    }

    return nonce;
  }
}

exports.Prover = Prover;












































