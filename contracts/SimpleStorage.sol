pragma solidity ^0.4.24;

contract SimpleStorage{
    string ipfsHash;
    string[] public fileHashes;

    mapping(uint => string) hashes;
    uint public hashcount;

    constructor() public{
        
        hashcount = 0;
    }

    function set(string x) public {
        ipfsHash = x;
    }

    function get() public view returns(string){
        return ipfsHash;
    }

    function setFileHash(string x) public payable{
        hashes[hashcount] = x;
        hashcount++;
    }

    function getFileHashes(uint i) public view returns(string){
        return hashes[i];
    }
}