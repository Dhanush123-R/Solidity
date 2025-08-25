// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.10 < 0.9.0;

contract Operations {

    uint256 c;

    function addNumbers(uint256 _a, uint256 _b) external pure returns(uint256) {
        return (_a + _b);
    }

    function subNumbers(uint256 _a, uint256 _b) external pure returns(uint256) {
        return (_a - _b);
    }

    function mulNumbers(uint256 _a, uint256 _b) external pure returns(uint256) {
        return (_a * _b);
    }

    function divNumbers(uint256 _a, uint256 _b) external pure returns(uint256) {
        return (_a / _b);
    }
}

contract Calculator {

    Operations public operations;

    uint256 res;

    constructor(address _addr) {
        operations = Operations(_addr);
    }

    function addition(uint256 _a, uint256 _b) external view returns(uint256) {
        return operations.addNumbers( _a, _b);
    }

    function subtraction(uint256 _a, uint256 _b) external view returns(uint256) {
        return operations.subNumbers(_a,_b);
    }

    function multiplication(uint256 _a, uint256 _b) external view returns(uint256) {
        return operations.mulNumbers(_a,_b);
    }

    function division(uint256 _a, uint256 _b) external view returns(uint256){
        return operations.divNumbers(_a,_b);
    }
}
