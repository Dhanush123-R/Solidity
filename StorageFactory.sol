//SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

//import the entire contract present in the  simplestorage file 
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    //uint256 public favoriteNumber
    //type visibility name

    SimpleStorage[] public listOfSimpleStorage;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorage.push(newSimpleStorageContract);
    }

    function sfstore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //address
        //ABI - Application Binary Interface

        listOfSimpleStorage[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorage) public view returns(uint256) {
        return listOfSimpleStorage[_simpleStorage].retrive();
    }
}
