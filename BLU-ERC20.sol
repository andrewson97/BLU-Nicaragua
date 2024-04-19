// File: contracts/Blue.sol



pragma solidity ^0.8.18;

import "./ERC20.sol";

contract Blue20 is ERC20  {
    address payable public owner;

    struct TokenMetadata {
            string volume_ml;
            string date;
            string facility_id;
            string sensor_id;
    }

    mapping(uint256 => TokenMetadata) public tokenMetadata;


    constructor() ERC20 ("BlueToken","BLUE"){
        owner = payable(msg.sender);
    }
    
    
    function issueToken(string memory _volume_ml, string memory _date, string memory _facility, string memory _sensor) public {
        if (msg.sender == owner){
            uint256 tokenId = totalSupply() + 1;
            _mint(msg.sender,1);

            tokenMetadata[tokenId] = TokenMetadata({
            volume_ml: _volume_ml,
            date: _date,
            facility_id: _facility,
            sensor_id: _sensor

        });
            
        }
        else{
            require(msg.sender == owner, "Only owner of the contract can Mint tokens for now");
            return;
        }
    }
    

    function getTokenMetadata(uint256 tokenId) public view returns (string memory flow, string memory date, string memory facility_id, string memory sensor_id) {
    require(tokenId <= totalSupply(), "Token with this ID does not exist");
    
    TokenMetadata storage metadata = tokenMetadata[tokenId];
    return (metadata.volume_ml, metadata.date,metadata.facility_id,metadata.sensor_id);
}

}