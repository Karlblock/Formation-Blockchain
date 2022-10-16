// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract sendMonney {
    address theAddress;
    uint amount;

    function getaddress() public view returns(address) {
        return theAddress;
    }

    function getBalance() public view returns(uint) {
        return amount;
    }

    receive() external payable {
        theAddress = msg.sender;
        amount = amount + msg.value;
    }
}