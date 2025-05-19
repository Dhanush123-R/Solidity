// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Count{
    uint a = 0;
    address owner;
    // another way to declare to value to variable without giving directly
     constructor(){
         owner=msg.sender;
    }

    // modifier onlyOwner(){
    //     require(msg.sender==owner,"Not Authorized");
    //     _;
    // }

    function increment() public  {
        require(msg.sender == owner);
        a+=1;
    }

    function getValue() public view returns(uint){
        require(msg.sender == owner);
        return a;
    }

    function decrement() public {
        require(msg.sender == owner);
        a-=1;
    }

}
