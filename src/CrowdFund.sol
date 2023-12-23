// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract CrowdFund {
    constructor() {
        lastId = 0;
    }

    event Transfer(address indexed from, address indexed to, uint256 amount);

    struct Campaingn {
        uint256 Id;
        string Name;
        string Description;
        uint256 AmountRaised;
        uint256 Goal;
    }
    //Create a campaign

    Campaingn[] public CampaingnList;
    mapping(uint256 => Campaingn) CampaingnMapping;
    uint256 public lastId;

    function GetCampaigns() external view returns (Campaingn[] memory) {
        return CampaingnList;
    }

    function CreateCampaign(string memory name, string memory description, uint256 amountRaised, uint256 goal)
        external
        returns (bool)
    {
        uint256 id = incrementandReturnId();

        Campaingn memory campaign = Campaingn(lastId, name, description, amountRaised, goal);
        CampaingnList.push(campaign);
        CampaingnMapping[id] = campaign;
        return true;
    }

    function incrementandReturnId() private returns (uint256) {
        lastId++;
        return lastId;
    }
}
