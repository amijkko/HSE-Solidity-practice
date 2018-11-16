pragma solidity ^0.4.19;

contract Vote {
    
    mapping (address => bool) vote_map;
    uint public counter = 0;
    bool ended = false;
    mapping(uint256 => address) public users;
    uint256 countUsers = 0;
    uint256 public balance ;
    
    
    function distributePrize () public
    {
        uint256 winningNumber = uint256(block.blockhash(block.number - 1)) % countUsers;
   

        users[winningNumber].transfer(balance);    
    
    }
    function increaseBalance() public payable {
        balance +=  msg.value; 
    }
    
    
    function participate () {
        require(vote_map[msg.sender] == false);
        require(ended == false);
        vote_map[msg.sender] = true;
        users[countUsers] = msg.sender;
        countUsers += 1;
        
    }
}
