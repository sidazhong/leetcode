"use strict";

const SHOW = "SHOW_PRICE";
const UPDATE = "UPDATE_USD_PRICE";

let fs = require('fs');
let EventEmitter = require('events');

function readJsonFromFile(fileName) {
  // ***YOUR CODE HERE***
  //
  // Read from the specified file (using the fs module),
  // pass the contents to JSON.parse, and return the
  // resulting object.
	const coin2USD = JSON.parse(fs.readFileSync(fileName));
	return coin2USD;
  
	throw new Error("***FIXME***  readJsonFromFile not implemented.");
}

class CurrencyConverter extends EventEmitter {

  static calculateRates(usdPrices) {
    let rates = {};
    let usdPrices_compare = usdPrices.slice();
    
    for (let i in usdPrices) {
      let o = usdPrices[i];
      let sym = o['asset_id_quote'];
      let usdRate = o['rate'];
      rates[`USD-${sym}`] = usdRate;
      rates[`${sym}-USD`] = 1/usdRate;

      // ***YOUR CODE HERE***
      //
      // Now that you have the price of the cryptocurrency in USD,
      // set the rates for trading different cryptocurrencies directly,
      // calculating the relative prices based off of their USD prices.
      //
      // For example, if `sym` is "BTC", calculate the values for
      // "BTC-ETH", "ETH-BTC", "BTC-EOS", "EOS-BTC", etc.
      
      usdPrices_compare.shift();
      for(let k in usdPrices_compare){
      	let compare_o = usdPrices_compare[k];
      	let compare_sym = compare_o['asset_id_quote'];
      	let compare_usdRate = compare_o['rate']/o['rate'];
      	
      	if(sym === compare_sym){
      		continue;
      	}else{
      		rates[sym+'-'+compare_sym] = compare_usdRate;
      	  rates[compare_sym+'-'+sym] = 1/compare_usdRate;
      	}
      }
    }
    
    return rates;
  }

  // Prices must be in terms of USD.
  // Filter out date property.
  constructor(coin2USD) {
    super();
    this.rates = this.constructor.calculateRates(coin2USD.rates);

    this.on(SHOW, (o) => {
      // ***YOUR CODE HERE***
      //
      // Given an amount of 1 coin, print out what the equivalent
      // amount of a different coin would be.
      // Sample 'emit' events are given at the end of this file.
    	
    	let rs = '1' + o.from + ' = ' + this.rates[o.from+'-'+o.to] + o.to;
    	console.log(rs);
    });

    // ***YOUR CODE HERE***
    //
    // Add another event handler for the UPDATE event.
    // A sample invocation is given towards the end of this file.
    this.on(UPDATE, (o) => {
    	for (let k in coin2USD.rates) {
    		if(coin2USD.rates[k].asset_id_quote===o.sym){
    			coin2USD.rates[k].rate = 1/o.usdPrice;
    			break;
    		}
    	}
    	
    	this.rates = this.constructor.calculateRates(coin2USD.rates);
    });
  }

  convert(amount, fromUnits, toUnits) {
    let tag = `${fromUnits}-${toUnits}`;
    let rate = this.rates[tag];
    if (rate === undefined) {
      throw new Error(`Rate for ${tag} not found`);
    }
    return rate * amount;
  }

}

//part1
let cnv = new CurrencyConverter(readJsonFromFile('./rates.json'));
console.log(cnv.rates);

//part2
console.log();
function test(amt, from, to) {
  console.log(`${amt} ${from} is worth ${cnv.convert(amt, from, to)} ${to}.`);
}
test(4000, 'ETH', 'BTC');
test(200, 'BTC', 'EOS');

//part3
cnv.emit(SHOW, {from: "EOS", to: "BTC"});
cnv.emit(SHOW, {from: "EOS", to: "ETH"});
cnv.emit(SHOW, {from: "ETC", to: "ETH"});
cnv.emit(SHOW, {from: "LTC", to: "BTC"});
cnv.emit(UPDATE, {sym: "BTC", usdPrice: 50000});
cnv.emit(SHOW, {from: "LTC", to: "BTC"});


