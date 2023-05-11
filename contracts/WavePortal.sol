// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] sendersArray;
    uint32 userCount;

    struct WaveDetail {
        uint timestamp;
        uint gasCost;
    }

    //mapping to store user's details
    struct Interaction {
        uint32 numberOfWaves;
        uint balance;
        //define the charateristics of ech wave
        // the timestamp
        // the gas cost
        mapping(uint32 => WaveDetail) waveRecord;
    }

    mapping(address => Interaction) storeDetails;

    constructor() {
        console.log("Yo yo, Lakeman's Smart contract!!!");
    }

    function wave() public payable {
        sendersArray.push(msg.sender);
        totalWaves += 1; 

        storeDetails[msg.sender].balance = address(msg.sender).balance;

        WaveDetail memory waveee = WaveDetail(block.timestamp, tx.gasprice);
        storeDetails[msg.sender].waveRecord[storeDetails[msg.sender].numberOfWaves] = waveee;
        storeDetails[msg.sender].numberOfWaves++;

        // storeDetails[msg.sender] = userWaveDetails;
        console.log("%s has waved!", msg.sender);
        console.log("wave details %s",  storeDetails[msg.sender].balance);
        console.log("wave gas cost %s",  storeDetails[msg.sender].waveRecord[storeDetails[msg.sender].numberOfWaves].gasCost);
        console.log("wave transaction time stamp  %s",  storeDetails[msg.sender].waveRecord[storeDetails[msg.sender].numberOfWaves].timestamp);
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