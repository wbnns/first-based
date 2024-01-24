// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../@openzeppelin/contracts/access/Ownable.sol";
import "../@openzeppelin/contracts/utils/Strings.sol";
import "./Base64.sol";

interface IMetadataRenderer {
    function tokenURI(uint256) external view returns (string memory);
    function contractURI() external view returns (string memory);
}

contract FirstBased is ERC721, Ownable {
    using Strings for uint256;
    event Claimed(address minter, uint blockNumber);

    IMetadataRenderer public renderer;

    constructor(string memory _name, string memory _symbol, IMetadataRenderer _renderer) ERC721(_name, _symbol) {
        renderer = _renderer;
        _mint(msg.sender, block.number);
    }

    function mint() external {
        uint256 currentBlockNumber = block.number;
        require(!_exists(currentBlockNumber), "This block has already been claimed");

        _mint(msg.sender, currentBlockNumber);

        emit Claimed(msg.sender, currentBlockNumber);
    }

    function tokenURI(uint tokenId) public view override returns (string memory) {
        return renderer.tokenURI(tokenId);
    }

    function contractURI() public view returns (string memory){
        return renderer.contractURI();
    }

    function setRenderer(IMetadataRenderer _newRenderer) external onlyOwner {
        renderer = _newRenderer;
    }
}
