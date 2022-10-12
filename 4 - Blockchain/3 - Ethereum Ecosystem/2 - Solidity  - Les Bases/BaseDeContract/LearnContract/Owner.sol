// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract Owner {

    address owner;
      constructor() {
       owner = msg.sender;
   }

   modifier isOwner() {
       require(msg.sender == owner , 'Your not owner !');
       _;
   }

}
