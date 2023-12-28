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
    error Decimals_Exceeded();

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
        CampaingnDeposits[id] = 0;
        return true;
    }

    function incrementandReturnId() private returns (uint256) {
        lastId++;
        return lastId;
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getCampaignDeposit(uint256 id) external view returns (uint256) {
        return CampaingnDeposits[id];
    }

    function fundCampaign(uint256 id, uint256 amt) external payable returns (bool) {
        //find the campaign
        Campaingn memory receiveingCamp = CampaingnMapping[id];
        if (receiveingCamp.Id == 0) {
            revert CampaingnNotFound();
        }
        uint256 receivedAmount = amt;
        if (receivedAmount == 0) {
            revert Insufficient_Balance();
        }
        CampaingnDeposits[id] += msg.value;
        if (receiveingCamp.Goal >= CampaingnDeposits[id]) {
            payCampaign(id);
        }
        return true;
    }

    function fundContract(uint256 id) public payable {
        //find the campaign
        Campaingn memory receiveingCamp = CampaingnMapping[id];
        if (receiveingCamp.Id == 0) {
            revert CampaingnNotFound();
        }
        if (msg.value == 0) {
            revert Insufficient_Balance();
        }
        CampaingnDeposits[id] += msg.value;
    }

    function payCampaign(uint256 id) public returns (bool) {
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
