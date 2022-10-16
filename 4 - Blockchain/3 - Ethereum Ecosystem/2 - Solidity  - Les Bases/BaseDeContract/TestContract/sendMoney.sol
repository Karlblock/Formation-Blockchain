// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

 
contract SendMoneyExemple {

    address owner;
    bool public paused;
    uint public balanceReceived;
  
     function receiveMoney() public payable {
        balanceReceived += msg.value;
    }
     function getBalance() public view returns(uint) {
        return address(this).balance;
        }

    function sedPause(bool _paused) public {
        require(msg.sender == owner, 'you are not the Owner');
        paused = _paused;
    }
   
    function whithdrowMoneyTo(address payable _to) public {
        require(msg.sender == owner,"You Are note the Owner");
        require(!paused, 'Contract is paused');
         _to.transfer(address(this).balance);
    }
 
}


