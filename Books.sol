// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Notes{
    uint sno = 1; //if i want to use this, then i have to use mapping not array logic
    address owner;

    //Book[] public books; // array logic
    mapping(uint => Book) public books; // to use the sno 

    struct Book{
        string author;
        string bookname;
        uint year;
    }

    // 1 time executable
    constructor(){
        owner = msg.sender;
    }

    // confirm the access only to owner
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // memory - temporary store the value like RAM
    function assignValue(string memory _author, string memory _bookname, uint _year) public  onlyOwner{
        //books.push(Book(_author, _bookname, _year)); // this line for array type logic
        books[sno] = Book(_author, _bookname, _year); // this line for mapping logic
        sno++;
    }

    function getBook(uint _sno) public view returns (string memory _author, string memory _bookname, uint _year){
        //if(books.length == 0) return("","",0); // books.length is not used in mapping for that create seperate function 
        //Book storage b = books[0]; // for array logic
        Book storage b = books[_sno];
        return(b.author, b.bookname, b.year);
    }

    // this function is count the totalbooks is present in the database & mainly used for mapping
    function totalBooks() public view returns(uint){
        return sno - 1;
    }

}
