// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

contract CRUD {

    struct Person {
        string name;
        uint256 age;
    }

    mapping (address => Person) people;


    function createPerson(string memory name, uint256 age) public {
        require (keccak256(abi.encodePacked(people[msg.sender].name)) == keccak256(abi.encodePacked("")), "Error, this address has a username already registered");
        Person storage person = people[msg.sender];
        person.name = name;
        person.age = age;
    }

    function updatePersonName(string memory name) public {
        require (keccak256(abi.encodePacked(people[msg.sender].name)) != keccak256(abi.encodePacked("")), "Error, this address is not registered yet");
        Person storage person = people[msg.sender];
        person.name = name;
    }
    
    function updatePersonAge(uint256 age) public {
        require (keccak256(abi.encodePacked(people[msg.sender].name)) != keccak256(abi.encodePacked("")), "Error, this address is not registered yet");
        Person storage person = people[msg.sender];
        person.age = age;
    }

    function readMyself() public view returns (Person memory) {
        require (keccak256(abi.encodePacked(people[msg.sender].name)) != keccak256(abi.encodePacked("")), "Error, this address is not registered yet");
        Person memory person = people[msg.sender];
        return person;
    }

    function deleteMyself() public {
        require (keccak256(abi.encodePacked(people[msg.sender].name)) != keccak256(abi.encodePacked("")), "Error, this address is not registered yet");
        delete people[msg.sender];
    }

}