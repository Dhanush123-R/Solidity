//SPDX-License-Identifier: MIT
pragma solidity 0.8.30; // version of the solidity

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes

    uint256 myFavoriteNumber; // if no value is given, the value will be 0

    //uint256[]  listOfFavoriteNumbers; //[0,24,46,85]
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    //dynamic array
    Person[] public listOfPeople; //empty list  []


    mapping(string => uint256) public nameToFavorite;

    function store(uint256 _favoriteNumber) public virtual  {
        myFavoriteNumber = _favoriteNumber;
        retrive();
    }

    //view - marked view in a contract only to read, pure
    function retrive() public view returns(uint256){
        return myFavoriteNumber; // ex for view
        // return 7;  this is ex for pure.
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavorite[_name] = _favoriteNumber;
    }
}
