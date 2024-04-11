// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract BoreToken is ERC721, ERC721Pausable, Ownable, ERC721Burnable {

    string private _baseTokenURI;
    mapping(uint256 => string) private _tokenURIs;

    constructor(address initialOwner, string memory baseTokenURI)
        ERC721("BoreToken", "BTK")
        Ownable(initialOwner)
    {
            _baseTokenURI = baseTokenURI;
    }


    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
       
        string memory _tokenURI = _tokenURIs[tokenId];

        // If there is no base URI, return the token URI.
        if (bytes(_baseTokenURI).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_baseTokenURI).length > 0) {
            
            if(bytes(_tokenURI).length == 0) {
                // If there is a baseURI but no tokenURI, concatenate the tokenID to the baseURI.
                return string.concat(_baseTokenURI, Strings.toString(tokenId));
            }
            
            return string(abi.encodePacked(_baseTokenURI, _tokenURI));
        }
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to, uint256 tokenId, string memory _tokenURI) public onlyOwner {
        _tokenURIs[tokenId] = _tokenURI;
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
}