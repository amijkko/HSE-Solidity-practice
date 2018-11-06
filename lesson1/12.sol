pragma solidity ^0.4.19;

contract HelloHse {

    uint digits = 10; 
    uint power = 10 ** digits;
    
    
    struct Student{
        string name;
        uint age;
    } 
    
    
    Student[] public students;
    
    
    function _applytoHSE(string _name, uint _age) private
    {
        students.push(Student(_name,_age));
    }
    
    function _generateRandomStudent(string _name) private view returns(uint)
    {
        uint rand = uint(keccak256(_name));
        return rand % power; 
    }
    
    function applytoHSE(string _name) public
    {
        uint randAge = _generateRandomStudent(_name);
        _applytoHSE(_name,randAge);
    }
}

