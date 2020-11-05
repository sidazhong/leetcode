pragma solidity ^0.7;

// A distributed lottery game (with some flaws).
contract TemperatureOracle {
    
    //An address for the user authorized to perform updates.
    address public user;
    
    //A mapping of zip codes to temperatures.
    mapping(uint => uint) public map_zipcode;
    
    
    constructor() {
        //In the constructor, set the caller's address to the authorized address.
    	require(user == msg.sender);
    }	
    
    //Add an updateTemp function. This function should take in a zip code and a temperature.
    function updateTemp(uint zipcode, uint temperature) external {
    	//Use a require statement to ensure that only the authorized user may access this function. 
    	require(msg.sender == user);
    		
    	//Update the temperature for the zip code in your mapping.
        map_zipcode[zipcode] = temperature;
    }
    
    //Add a getter method getTemp
    function getTemp(uint zipcode) public view returns (uint) {
    	//lets you look up a temperature for a given zipcode.
        return map_zipcode[zipcode];
    }
}