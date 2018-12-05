pragma solidity ^0.4.18;

contract utility {
    bytes32 public passwordInBytes;
    
    
    function PasswordToBytes (uint _pasword) public
  {
      passwordInBytes = bytes32(keccak256(_pasword));
  }
  
    
}


contract Vault {
  bool public locked;
  bytes32 private password;
  bytes32 private information;
  
  
  function Vault(bytes32 _password) public {
    locked = true;
    password = _password;
  }
  
  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
  function setInformation(bytes32 _information) public {
      information = _information; 
  }
}