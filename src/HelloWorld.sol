// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract HelloWorld {
    uint256 private number = 2;

    function SayHello() public pure returns (string memory) {
        return "Hello World";
    }

    function MultiplyByTwo() public {
        uint256 soln = number * 2;
        number = soln;
    }

    function GetNumber() external view returns (uint256) {
        return number;
    }
}
