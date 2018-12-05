pragma solidity ^0.4.18;

import './standartToken.sol';


contract Crowdsale is Ownable {
    
    address owner;
    
    using SafeMath for uint;
    SimpleTokenCoin public token = new SimpleTokenCoin();
    
    uint start = 1543449600;
    
    uint period = 28;
    
    address multisig;
    uint hardcap;
    uint softcap;
    
    uint rate;
    uint restrictedPercent;
    address restricted;
    mapping (address => uint) balances;
    
    modifier saleIsOn ()
    {
        require(now > start && now < start + period * 1 days );
        _;
    }
    
    modifier isUnderHardCap ()
    {
        require(multisig.balance<=hardcap);
        _;
        
    }
    
    
    function Crowdsale(address _multisig,address _restricted) {
        
        multisig = _multisig;
        restricted = _restricted;
        restrictedPercent = 40;
        rate = 100000000000000000000;
        start = 1543449600;
        period = 28;
        hardcap = 10000000000000000000000;
    }
    function refund () {
    require(this.balance > softcap && now > start + period * 1 days);
    uint value = balances[msg.sender];
    msg.sender.transfer(value);
    balances[msg.sender]= 0;
    
    }
    function finishCrowdsale () onlyOwner {
        uint issuedTokens = token.totalSupply();
        uint restrictedTokens= issuedTokens.mul(restrictedPercent).div(100-restrictedPercent);
        token.mint(restricted,restrictedTokens);
        token.finishMinting;
    }
    function createTokens() isUnderHardCap saleIsOn payable {
        multisig.transfer(msg.value);
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        uint tokens = rate.mul(msg.value).div(1 ether);
        token.mint(msg.sender, tokens);
    }
    
    function() external payable {
        createTokens();
    }
    
}