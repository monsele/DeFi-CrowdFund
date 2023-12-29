// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

//import { expect } from '@forge-std/test-utils';
import {Test, console2} from "forge-std/Test.sol";
import {CrowdFund} from "../src/CrowdFund.sol";
import {Campaingn} from "../libStructs/Common.sol";

contract TestCrowdFund is Test {
    // ... other test cases
    CrowdFund testFund;

    constructor() {
        testFund = new CrowdFund();
    }

    function testCreateCampaign() public {
        // Arrange
        uint256 initialCampaignCount = testFund.GetCampaingnLength();

        // Act
        testFund.CreateCampaign(
            "Test Campaign", "Description", 0, 1000 wei, payable(0x1234567890123456789012345678901234567890)
        );

        // Assert
        // expect(testFund.CampaingnList.length).to.equal(initialCampaignCount + 1);
        assert(testFund.GetCampaingnLength() == initialCampaignCount + 1);
        Campaingn memory lastCampaign = testFund.GetCampaingn(testFund.GetCampaingnLength());

        assert(lastCampaign.Id == testFund.GetLastId());
        assert((keccak256(abi.encodePacked((lastCampaign.Name))) == keccak256(abi.encodePacked(("Test Campaign")))));
        assert(
            (keccak256(abi.encodePacked((lastCampaign.Description))) == keccak256(abi.encodePacked(("Description"))))
        );

        assert(lastCampaign.AmountRaised == 0);
        assert(lastCampaign.Goal == 1000 wei);
        assert(lastCampaign.DepositAddress == payable(0x1234567890123456789012345678901234567890));
        assert(lastCampaign.Open == true);
    }
}
