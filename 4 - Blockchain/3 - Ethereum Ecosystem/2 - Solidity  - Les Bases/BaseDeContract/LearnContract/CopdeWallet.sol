// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract Wallet {

//struction wallet
    struct wallet {
        uint balance;
        uint numPay;
    }

//mapping de wallet

    mapping(address => wallet) Wallets;

//function getTotalBalance

    function getTotalBalance() public view returns(uint) {
        return address(this).balance;

    }

//function Balance

    function getBalance() public view returns(uint) {
        return Wallets[msg.sender].balance;
    }

//functiuon Withdraw aLL Money

    function withdrawAllMoney(address payable _to) public view {
        uint amount = Wallets[msg.sender].balance;
         Wallets[msg.sender].balance = 0;
        _to.transfer(amount);

    }

//receiver
    receiver() external payable{
        Wallets[msg.sender].balance += msg.value;
        Wallets[msg.sender].numPay += 1;
    }


}
