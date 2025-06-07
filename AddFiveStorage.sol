//SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {

    //virtual - base class or file,  override - current class or file

    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber+5;
    }
}
