pragma solidity 0.4.24;


contract OverflowUnderFlow {
    uint public zero = 0;
    uint public max = 2**256-1;
    
    // zero will end up at 2**256-1
    function underflow() public {
        zero -= 1;
    }
    // max will end up at 0
    function overflow() public {
        max += 1;
    }
}