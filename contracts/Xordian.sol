// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Xordian is ERC721Enumerable, Ownable {
    string _baseTokenURI;

    constructor() ERC721("XordianNFTs", "XORDIANS") {
        setBaseURI("ipfs://Qme3K4iMNvTwfxJSL7urFWEYXrfLrXoPkECLx7eEiM5q9E/");
        console.log("deployed with baseURI set: ", _baseTokenURI);
    }

    uint256 maxNum = 11;

    function mint() public {
        require(totalSupply() < maxNum);
        uint256 nextTokenId = totalSupply();
        console.log("next tokenId: ", nextTokenId);
        _mint(msg.sender, nextTokenId);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string memory baseURI) public onlyOwner {
        _baseTokenURI = baseURI;
    }
}
