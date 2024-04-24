// File: contracts/Blue.sol
//SPDX-License-Identifier: UNLICENSED


pragma solidity ^0.8.17;

import "./ERC20.sol";

contract Blue20 is ERC20  {
    address payable public owner;
    uint256 varientId = 0;

    struct VarientMetadata {
            string facility_id;
            string sensor_id;
            string date;
            uint256 varient_supply;
    }

    mapping(uint256 => VarientMetadata) public varientMetadata;


    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20 (name, symbol){
        owner = payable(msg.sender);
        _mint(msg.sender, initialSupply);
    }

    function addVarient(string memory _facility, string memory _sensor, string memory _date) public {
        require(msg.sender == owner, "Only the owner can add varient");
        varientId = varientId + 1;

        varientMetadata[varientId] = VarientMetadata({
            facility_id: _facility,
            sensor_id: _sensor,
            date: _date,
            varient_supply: 0
        });
    }
    
    function increaseTotalSupply(uint256 _varientId, uint256 _amount) public {
        require(msg.sender == owner, "Only the owner can increase total supply");
        require(_varientId <= varientId, "Varient with this ID does not exist");

        VarientMetadata storage varient = varientMetadata[_varientId];
        varient.varient_supply += _amount;

        // Mint new tokens and add them to the total supply
        _mint(msg.sender, _amount);
    }

    function issueToken(uint256 _volume_l, address _to) public {
        require(msg.sender == owner, "Only the owner can mint tokens");

        // Increase allowance by _volume_ml to _to
        _approve(msg.sender, _to, allowance(msg.sender, _to) + _volume_l);
    }

    

    function getVarientMetadata(uint256 _varientId) public view returns (string memory facility_id, string memory sensor_id, string memory date, uint256 varient_supply) {
        require(_varientId <= varientId, "Varient with this ID does not exist");

        VarientMetadata storage metadata = varientMetadata[_varientId];
        return (metadata.facility_id, metadata.sensor_id, metadata.date, metadata.varient_supply);
    }

    function getNumberOfVariants() public view returns (uint256) {
        return varientId;
    }


}