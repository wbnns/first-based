// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./IMetadataRenderer.sol";
import "./Base64.sol"; // Make sure to include your Base64 library

contract MetadataRenderer is IMetadataRenderer {
    using Base64 for string;

    // tokenURI function to generate the metadata for each NFT
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory svg = generateSVGImage(tokenId);
        string memory json = Base64.encode(bytes(string(abi.encodePacked(
            '{"name": "FIRST & BASED #', uintToString(tokenId), '", ',
            '"description": "First and only based NFT in each new block on Base", ',
            '"image": "data:image/svg+xml;base64,', Base64.encode(bytes(svg)), '"}'
        ))));
        return string(abi.encodePacked('data:application/json;base64,', json));
    }

    // contractURI function to provide metadata for the entire collection
    function contractURI() external pure override returns (string memory) {
        // Example contract-level metadata URI
        return "data:application/json;base64,...";
    }

    // Function to generate the SVG image for each NFT
    function generateSVGImage(uint256) private view returns (string memory) {
        string memory blockNumber = uintToString(block.number); // Using block number
        return string(abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500">',
            '<rect width="100%" height="100%" fill="#0052FF" />',
            '<text x="50" y="250" fill="#FFFFFF" font-size="24" font-family="Arial, sans-serif">',
            'FIRST &amp; BASED: BLOCK #', blockNumber,
            '</text></svg>'
        ));
    }

    // Utility function to convert a uint256 to a string
    function uintToString(uint256 _i) private pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}

