// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Wallet {
    address owner;
    uint balance;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount <= balance && msg.sender == owner, "Insufficient balance or unauthorized sender");
        balance -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance() public view returns (uint) {
        return balance;
    }

    receive() external payable {
        // fallback function
        balance += msg.value;
    }
}
