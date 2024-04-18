// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// require, assert and revert

contract Escrow {
    address public payer;
    address public payee;
    address public arbiter;
    uint public amount;
    bool public paid;

    constructor(address _payer, address _payee, address _arbiter, uint _amount) {
        require(_payer != address(0), "Invalid payer address");
        require(_payee != address(0), "Invalid payee address");
        require(_arbiter != address(0), "Invalid arbiter address");
        require(_amount > 0, "Invalid amount");

        payer = _payer;
        payee = _payee;
        arbiter = _arbiter;
        amount = _amount;
    }



    function deposit() external payable {
        require(msg.sender == payer, "Only the payer can deposit funds");  // use require function  
        require(!paid, "Funds have already been released");
        require(msg.value == amount, "Incorrect amount sent");
        assert(address(this).balance >= amount); // use of assert function  
    }

    function release() external {
        require(msg.sender == arbiter, "Only the arbiter can release funds");
        require(!paid, "Funds have already been released");
        payable(payee).transfer(amount);
        paid = true;
        assert(address(this).balance == 0);
    }

    function refund() external {
        require(msg.sender == arbiter, "Only the arbiter can refund funds");
        require(!paid, "Funds have already been released");
        payable(payer).transfer(amount);
        paid = true;
        assert(address(this).balance == 0);
    }

    fallback() external {
        revert("Fallback function not allowed"); // using of revert function
    }
}
