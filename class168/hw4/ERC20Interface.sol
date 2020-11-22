pragma solidity ^0.7;

// Reference open source:
// https://ethereum.org/en/developers/tutorials/transfers-and-approval-of-erc-20-tokens-from-a-solidity-smart-contract/


// Updated version from https://theethereum.wiki/w/index.php/ERC20_Token_Standard
abstract contract ERC20Interface {

    function totalSupply() public virtual view returns (uint);
    function balanceOf(address tokenOwner) public virtual view returns (uint balance);
    function allowance(address tokenOwner, address spender) public virtual view returns (uint remaining);

    function transfer(address to, uint tokens) public virtual returns (bool success);
    function approve(address spender, uint tokens) public virtual returns (bool success);
    function transferFrom(address from, address to, uint tokens) public virtual returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract ERC20Basic is ERC20Interface {
    
    //symbol -- A field with the 3-letter token name of your choice. Its type should be "string public constant".
    string public constant symbol = "ERC20";
    
    //name -- Your name, stored in a string public constant field.
    string public constant name = "sidazhong";
    
    uint8 public constant decimals = 18;
    
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    uint256 totalSupply_ = 20 ether;
    
    using SafeMath for uint256;
    
    //Probably the easiest way to track this information is in a mapping(address => bool) field of the contract. Be sure that it is private.
    mapping(address => bool) private is_freeze;
    
    constructor() {
        balances[msg.sender] = totalSupply_;
    }
    
    
    //freeze(address) -- Marks the given address as frozen.
    function freeze(address addr) public {
        is_freeze[addr]=true;
    }
    
    //thaw(address) -- Unmarks the given address as frozen.
    function thaw(address addr) public {
        is_freeze[addr]=false;
    }
    
    //Add a `burn(uint)` function. 
    function burn(uint numTokens) public {
        //It should destroy the specified number of tokens, if the caller has sufficient tokens.
        require(numTokens <= balances[msg.sender]);
        
        //The caller's balance and the totalSupply function should both reflect the reduction in the coin supply.
        balances[msg.sender] = balanceOf(msg.sender).sub(numTokens);
        totalSupply_ = totalSupply().sub(numTokens);
    }
    
    
    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }
    
    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }
    
    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        
        //Update the transfer methods so that they will fail to transfer funds if the sender's account is frozen.
        require(is_freeze[msg.sender]==false);
        
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
    
    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
    
    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }
    
    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
        
        //Update the transferFrom methods so that they will fail to transfer funds if the sender's account is frozen.
        require(is_freeze[msg.sender]==false);
        
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}

library SafeMath {
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}



















