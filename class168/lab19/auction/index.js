"use strict";
let web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))
let account;
web3.eth.getAccounts().then((f) => {
 account = f[0];
});

// Load the ABI produced by the compiler
//*** PASTE ABI HERE ***
let contractName = "Auction_sol_Auction";
let abi = JSON.parse(fs.readFileSync(`${contractName}.abi`).toString());

// Load the contract.
let contract = new web3.eth.Contract(abi);

//*** REPLACE WITH THE CONTRACT ADDRESS ***
contract.options.address = "0xF13b6094E643A57C41C29A5fCC7D540E007f9032";

function makeBid() {
  let bid = parseInt($("#bid").val());
  // ***YOUR CODE HERE***
  // Get the bidder (converting to hex), and then call
  // the makeBid function from your smart contract.
  
  //Get the bidder (converting to hex)
  let bidder = parseInt($("#bidder").val(),16);
  
  //call the makeBid function from your smart contract.
  contract.methods.makeBid(true).send({
  	name:bidder,
  	bid:bid,
  });
}

function updateResults() {
  // ***YOUR CODE HERE***
	
	//the high bid is shown on the page whenever a bid is made.
	contract.methods.getTopBid().call((_, bids) => {
		$("highBid").val("the high bid is" + bids);
	});
}

// Load initial results upon loading.
updateResults();














