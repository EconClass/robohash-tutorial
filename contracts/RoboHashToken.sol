pragma solidity ^0.5.8;

import "node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol";

contract RoboHashToken is ERC721Mintable("RoboHashToken","RHT") {
  mapping (uint256 => string) internal tokenIdToName;
  mapping (string => uint256) internal nameToTokenId;

  function create(string _name) public {
    require(nameToTokenId[_name] == 0, "Name has been claimed");
    uint256 tokenId = allTokens.length + 1;
    mint(msg.sender, tokenId);
    tokenIdToName[tokenId] = _name;
    nameToTokenId[_name] = tokenId;
  }

  function getTokenName(uint256 _tokenId) public view returns(string) {
    return tokenIdToName[_tokenId];
  }

  function getTokenId(string _name) public view returns(uint256) {
    return nameToTokenId[_name];
  }
}