pragma solidity 0.4.24;
contract C {
    uint public x;

    function cannotBeCalled() external {
        x = 42;
    }

    function canBeCalled() public {
       x = 31337;
    }
    // does not compile because of this function.
    // cannotBeCalled is not visible to the contract itself
    function testExternal() public  {  
       cannotBeCalled();
       // x = 1234;
    }       
}

contract D {
    function test(address _address) public {
        C(_address).cannotBeCalled(); // this call is not a problem
    }
}