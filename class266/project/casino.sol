pragma solidity ^0.5.11;

contract Casino {
    
    uint private start;
    
    uint private buyPeriod = 1000;
    uint private verifyPeriod = 100;
    uint private checkPeriod = 100;
    string private name = "123";
    
    mapping(address => uint) private _tickets;
    mapping(address => uint) private _winnings;

    address[] _entries;
    address[] _verified;

    uint private winnerSeed;
    bool private hasWinner;
    address private winner;
    
    constructor()
        public
        payable{
        start = block.timestamp;    
    }
    
    /**
     * This should NOT be part of the contract!!
     */
    function unsafeEntry(uint number, uint salt) 
        public
        payable
        returns (bool) {
        return buyTicket(generateHash(number, salt));
    }
    
    function generateHash(uint number, uint salt)
        public
        pure
        returns (uint) {
        uint source = number + salt;
        bytes memory source_b = toBytes(source);
        return uint(keccak256(source_b));
    }
    
    function toBytes(uint256 x) 
        public
        pure 
        returns (bytes memory b) {
        b = new bytes(32);
        assembly { mstore(add(b, 32), x) }
    }
    
    function buyTicket(uint hash)
        public
        payable
        returns (bool) {
        // Within the timeframe
        require(block.timestamp < start+buyPeriod);
        // Correct amount
        require(10 ether == msg.value);
        // 1 entry per address
        require(_tickets[msg.sender] == 0);
        _tickets[msg.sender] = hash;
        _entries.push(msg.sender);
        return true;
    }
    
    function verifyTicket(uint number, uint salt)
        public
        returns (bool) {
        // Within the timeframe
      //  require(block.timestamp >= start+buyPeriod);
    //    require(block.timestamp < start+buyPeriod+verifyPeriod);
        // Has a valid entry
        require(_tickets[msg.sender] > 0);
        // Validate hash
        require(salt > number);
        require(generateHash(number, salt) == _tickets[msg.sender]);
        winnerSeed = winnerSeed ^ salt ^ uint(msg.sender);
        _verified.push(msg.sender);
    }
    
    function setName(string memory newName) public {
        name = newName;
    }

    
    function getName() 
        public
        view
        returns (string memory){
            return name;
    }
    
    function checkWinner()
        public
        returns (bool) {
        // Within the timeframe
        //require(block.timestamp >= start+buyPeriod+verifyPeriod);
        //require(block.timestamp < start+buyPeriod+verifyPeriod+checkPeriod);
        if (!hasWinner) {
            winner = _verified[winnerSeed % _verified.length];
            _winnings[winner] = 30 ether;
            hasWinner = true;
        }
        return msg.sender == winner;
    }
    
    function claim()
        public {
        // Has winnings to claim
        //require(_winnings[msg.sender] > 0);
        uint claimAmount = _winnings[msg.sender];
        _winnings[msg.sender] = 0;
        msg.sender.transfer(claimAmount);        
    }
}