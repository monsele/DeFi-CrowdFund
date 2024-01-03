// SPDX-License-Identifier: SEE LICENSE IN LICENSE
// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.0;

import {Campaingn} from "../libStructs/Common.sol";

contract CrowdFund {
    error CampaingnNotFound();
    error Insufficient_Balance();
    error Decimals_Exceeded();

    address public owner;
    Campaingn[] public CampaingnList;
    mapping(uint256 => Campaingn) public CampaingnMapping;
    mapping(uint256 Id => uint256 Deposits) public CampaingnDeposits;
    uint256 public lastId;

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event paidCampaign(address indexed reciever, uint256 amountPaid);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        lastId = 0;
        owner = msg.sender; // Set the owner in the constructor
    }

    function fundContract(uint256 id) public payable returns (bool) {
        //find the campaign
        Campaingn memory receiveingCamp = CampaingnMapping[id];
        if (receiveingCamp.Id == 0) {
            revert CampaingnNotFound();
        }
        if (msg.value == 0) {
            revert Insufficient_Balance();
        }
        CampaingnDeposits[id] += msg.value;
        return true;
    }

    function CreateCampaign(
        string memory name,
        string memory description,
        uint256 goal,
        address payable depositAddress
    ) external returns (bool) {
        uint256 id = incrementandReturnId();

        Campaingn memory campaign = Campaingn(lastId, name, description, goal, depositAddress, true);
        CampaingnList.push(campaign);
        CampaingnMapping[id] = campaign;
        CampaingnDeposits[id] = 0;
        return true;
    }

    function getCampaignDeposit(uint256 id) external view returns (uint256) {
        return CampaingnDeposits[id];
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function GetCampaigns() external view returns (Campaingn[] memory) {
        return CampaingnList;
    }

    function GetCampaingnLength() public view returns (uint256) {
        return CampaingnList.length;
    }

    function GetCampaingn(uint256 id) public view returns (Campaingn memory) {
        return CampaingnMapping[id];
    }

    function GetLastId() public view returns (uint256) {
        return lastId;
    }

    function incrementandReturnId() private returns (uint256) {
        lastId++;
        return lastId;
    }

    function payCampaign(uint256 id) public onlyOwner returns (bool) {
        Campaingn memory receiveingCamp = CampaingnMapping[id];
        if (receiveingCamp.Id == 0) {
            revert CampaingnNotFound();
        }
        uint256 depositedAmt = CampaingnDeposits[id];
        if (address(this).balance >= depositedAmt) {
            revert Insufficient_Balance();
        }
        receiveingCamp.DepositAddress.transfer(depositedAmt);
        emit paidCampaign(receiveingCamp.DepositAddress, depositedAmt);
        return true;
    }

    function payCampaignOwner(uint256 id) private onlyOwner returns (bool) {
        Campaingn memory receiveingCamp = CampaingnMapping[id];
        if (receiveingCamp.Id == 0) {
            revert CampaingnNotFound();
        }
        uint256 depositedAmt = CampaingnDeposits[id];
        if (address(this).balance >= depositedAmt) {
            revert Insufficient_Balance();
        }
        receiveingCamp.DepositAddress.transfer(depositedAmt);
        emit paidCampaign(receiveingCamp.DepositAddress, depositedAmt);
        return true;
    }
}
