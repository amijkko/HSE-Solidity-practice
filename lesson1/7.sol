pragma solidity ^0.4.19;

contract HelloHse {

    uint digits = 100; 
    uint power = 10 ** digits;
    
    
    struct Student{
        string name;
        uint age;
    } 
    
    
    Student[] public students;
    
    
    function applytoHSE(string _name, uint _age)
    {
        students.push(Student(_name,_age));
    }
    
    
}