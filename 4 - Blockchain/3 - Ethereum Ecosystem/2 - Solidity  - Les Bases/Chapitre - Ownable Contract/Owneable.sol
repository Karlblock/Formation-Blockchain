
pragma solidity ^0.8.11;

contract ownableContract {
  address public owner;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

   /**
    * @dev Le constructeur Ownable défini le `owner` (propriétaire) original du contrat égal
    * à l'adresse du compte expéditeur (msg.sender).
    */
  function Ownable() public {
    owner = msg.sender;
  }

  /**
   * @dev Abandonne si appelé par un compte autre que le `owner`.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

   /**
    * @dev Permet au propriétaire actuel de transférer le contrôle du contrat
    * à un `newOwner` (nouveau propriétaire).
    * @param newOwner C'est l'adresse du nouveau propriétaire
    */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}