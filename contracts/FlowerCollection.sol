// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/token/ERC1155/ERC1155.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import "@openzeppelin/contracts/utils/Strings.sol";

contract FlowerCollection is Ownable, ERC1155 {
    // Base URI
    string private baseURI;
    string public name;

    constructor()
        ERC1155(
            'https://gateway.pinata.cloud/ipfs://QmW6BQqh6zRtcFtaqUNaxnDEzDtfG24dHaLp7txXoQuMhv/{id}.json'
        )
    {
        setName('Flower Collections');
    }

    function setURI(string memory _newuri) public onlyOwner {
        _setURI(_newuri);
    }

    function setName(string memory _name) public onlyOwner {
        name = _name;
    }

// Batch Mint of Flower collection to create TokenId
    function mintBatch(uint256[] memory ids, uint256[] memory amounts)
        public
        onlyOwner
    {
        _mintBatch(msg.sender, ids, amounts, '');
    }

// Batch Transfer of TokenId from one one account to other
function BatchTransferFrom(address _to,uint256[] memory ids, uint256[] memory amounts)
        public
        onlyOwner
    {
        _safeBatchTransferFrom(msg.sender, _to, ids,amounts, '');
    }

// Get URI link of any Token.
    function uri(uint256 _tokenid) override public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "https://gateway.pinata.cloud/ipfs/QmW6BQqh6zRtcFtaqUNaxnDEzDtfG24dHaLp7txXoQuMhv/",
                Strings.toString(_tokenid),".json"
            )
        );
    }

    function mint(uint256 id, uint256 amount) public onlyOwner {
        _mint(msg.sender, id, amount, '');
    }
}
