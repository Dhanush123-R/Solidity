//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Encoding {

    function combineString() public pure returns(string memory) {
        return string(abi.encodePacked("Mommm ", " I Miss You!"));
    }

    function encodeNumber() public pure returns(bytes memory) {
        bytes memory number = abi.encode(1);
        return number;
    }

    function encodeString() public pure returns(bytes memory) {
        bytes memory someString = abi.encode("some string");
        return someString;
    }

    function encodeStringPacked() public pure returns(bytes memory) {
        bytes memory encodePackedString = abi.encodePacked("some string");
        return encodePackedString;
    }
    
    function encodeStringBytes() public pure returns(bytes memory) {
        bytes memory SomeString = bytes("some string");
        return SomeString;
    }

    function decodeString() public pure returns(string memory) {
        string memory someString = abi.decode(encodeString(), (string));
        return someString;
    }

    function multiEncode() public pure returns(bytes memory) {
        bytes memory someString = abi.encode("some string", "It's fucking bigger");
        return someString;
    }

    function multiDecode() public pure returns(string memory, string memory) {
        (string memory someString, string memory someOtherString) = abi.decode(multiEncode(), (string, string));
        return (someString, someOtherString);
    }

    function multiEncodePacked() public pure returns(bytes memory) {
        bytes memory someString = abi.encodePacked("some string", "It's fucking bigger");
        return someString;
    }

    //This doesn't work - because evm tells it is packed version so i can't decode it
    function multiDecodePacked() public pure returns(string memory) {
        string memory someString = abi.decode(multiEncodePacked(), (string));
        return someString;
    }

    function multiStringCastPacked() public pure returns(string memory) {
        string memory someString = string(multiEncodePacked());
        return someString;
    }
}
