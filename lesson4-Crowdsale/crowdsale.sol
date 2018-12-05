pragma solidity ^0.4.18;

import './standartToken.sol';

contract Crowdsale {
    
    address owner;
    
    SimpleTokenCoin public token = new SimpleTokenCoin();
    
    uint start = 1543449600;
    
    uint period = 28;
    
    function Crowdsale() {
        owner = msg.sender;
    }
    
    function() external payable {
        require(now > start && now < start + period*24*60*60);
        owner.transfer(msg.value);
        token.mint(msg.sender, msg.value);
    }
    
}