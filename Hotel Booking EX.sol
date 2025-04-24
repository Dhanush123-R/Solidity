//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    enum Statuses { 
        Vacant, 
        Occupied 
        }
    Statuses public currentStatuses;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatuses = Statuses.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatuses == Statuses.Vacant, "Not Vacant");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ether");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        
        currentStatuses = Statuses.Occupied;
        // 1 way to transfer money
        owner.transfer(msg.value);
        // another way to transfer money is
        (bool sent, bytes memory data) = owner.call{value : msg.value} ("");

        emit Occupy(msg.sender, msg.value);
    }

}
