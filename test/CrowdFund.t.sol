// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

//import { expect } from '@forge-std/test-utils';
import {Test, console2} from "forge-std/Test.sol";
import {CrowdFund} from "../src/CrowdFund.sol";
import {Campaingn} from "../libStructs/Common.sol";
import {DeployCrowdFund} from "../script/DeployCrowdFund.s.sol";

contract TestCrowdFund is Test {
    CrowdFund testFund;
    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 1 ether;
    uint256 constant SEND_NOVALUE = 0 ether;
    uint256 constant STARTING_BALANCE = 10 ether;

    constructor() {
        DeployCrowdFund deployCode = new DeployCrowdFund();
        testFund = deployCode.run();
        vm.deal(USER, STARTING_BALANCE);
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

    function testfundContract() public {
        // Arrange
        uint256 campaignId = 1;
        // Campaingn memory campaign = Campaingn(campaignId, "Test Campaign", "Description", 0, 1000 wei, payable(0x1234567890123456789012345678901234567890),true);
        testFund.CreateCampaign(
            "Test Campaign", "Description", 0, 1000 wei, payable(0x1234567890123456789012345678901234567890)
        );
        //Campaingn memory lastCampaign = testFund.GetCampaingn(testFund.GetCampaingnLength());
        // testFund.CampaingnMapping[campaignId] = campaign;
        //testFund.CampaingnDeposits[campaignId] = depositAmount;
        //address payable expectedRecipient = payable(lastCampaign.DepositAddress);

        // Act
        bool success = testFund.fundContract{value: SEND_VALUE}(campaignId);
        // Assert
        assert(success == true);
        assert(address(this).balance > 0); // Contract balance reduced
        //assert(expectedRecipient.balance == depositAmount); // Recipient received funds
    }

    function testWithNoValue() public {
        testFund.CreateCampaign(
            "Test Campaign", "Description", 0, 1000 wei, payable(0x1234567890123456789012345678901234567890)
        );
        Campaingn memory lastCampaign = testFund.GetCampaingn(testFund.GetCampaingnLength());
        // Act
        vm.expectRevert();
        testFund.fundContract {value:SEND_NOVALUE}(lastCampaign.Id);
    }
}
