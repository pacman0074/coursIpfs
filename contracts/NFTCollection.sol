// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract TreeNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

	struct Tree{
		uint height;
		string categorie;
	}
	Tree[] tree;

    constructor() ERC721 ("Tree", "TR") {}

    function MintTree(address _player, string memory _tokenURI, uint _height, string memory _categorie) public returns (uint256)
    {
        _tokenIds.increment();
		tree.push(Tree(_height, _categorie));
        uint256 newItemId = _tokenIds.current();
        _mint(_player, newItemId);
        _setTokenURI(newItemId, _tokenURI);

        return newItemId;
    }
}
