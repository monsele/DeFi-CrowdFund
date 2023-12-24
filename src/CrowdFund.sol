// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract CrowdFund {
    address public owner;

    constructor() {
        lastId = 0;
        owner = msg.sender; // Set the owner in the constructor
    }

    // errors

    error CampaingnNotFound();
    error Insufficient_Balance();

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event paidCampaign(address indexed reciever, uint256 amountPaid);

    struct Campaingn {
        uint256 Id;
        string Name;
        string Description;
        uint256 AmountRaised;
        uint256 Goal;
        address payable DepositAddress;
        bool Open;
    }
    //Create a campaign

    Campaingn[] public CampaingnList;
    mapping(uint256 => Campaingn) CampaingnMapping;
    mapping(uint256 Id => uint256 Deposits) CampaingnDeposits;
    uint256 public lastId;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function GetCampaigns() external view returns (Campaingn[] memory) {
        return CampaingnList;
    }

    function CreateCampaign(
        string memory name,
        string memory description,
        uint256 amountRaised,
        uint256 goal,
        address payable depositAddress
    ) external returns (bool) {
        uint256 id = incrementandReturnId();

        Campaingn memory campaign = Campaingn(lastId, name, description, amountRaised, goal, depositAddress, true);
        CampaingnList.push(campaign);
        CampaingnMapping[id] = campaign;
        return true;
    }

    function incrementandReturnId() private returns (uint256) {
        lastId++;
        return lastId;
    }

    function fundCampaign(uint256 id) external payable returns (bool) {
        //find the campaign
        Campaingn memory receiveingCamp = CampaingnMapping[id];
        if (receiveingCamp.Id == 0) {
            revert CampaingnNotFound();
        }
        uint256 receivedAmount = msg.value;
        CampaingnDeposits[id] += receivedAmount;
       
        return true;
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
}
