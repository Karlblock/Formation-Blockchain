// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract Wallet {

    struct wallet {
        uint balance;
        uint numPayments;
    }

    mapping(address => wallet) Wallets;

    function getTotalBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getBalance() public view returns(uint) {
        return Wallets[msg.sender].balance;
    }
    function withdrawAllMoney(address payable _to) public {
        uint _amount = Wallets[msg.sender].balance;
        Wallets[msg.sender].balance = 0;
        _to.transfer(_amount);
    }

    receive() external payable{
        Wallets[msg.sender].balance += msg.value;
        Wallets[msg.sender].numPayments += 1;
    }

}
