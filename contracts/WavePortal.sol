// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] sendersArray;

    constructor() {
        console.log("Yo yo, Lakeman's Smart contract!!!");
    }

    function wave() public {
        sendersArray.push(msg.sender);
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAllAccountsThatSentWaves() public view returns (address[] memory) {
        console.log("%s has waved!",sendersArray.length);
        return sendersArray;
    }

    //get smart contract balance
    function getSmartContractBalance(address _address) public view returns(uint) {
        // console.log(address(_address).balance);
        return address(_address).balance;
    }
}