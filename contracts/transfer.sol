// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract TransferFunds {
   uint256 transactionCount;
   address public owner;

   constructor() payable {   
      owner = msg.sender;
   }


   event Transfer(address indexed from, address indexed receiver, uint amount, uint256 timestamp);

   struct TransferStruct{
      address sender;
      address receiver;
      uint amount;
      uint256 timestamp;
   }

   TransferStruct[] transactions;

   function getOwner() public view returns (address) {    
      return owner;
   }
   function viewBalance() external view returns(uint256) {
		return address(this).balance;
	}

    function transfer(address payable receiver, uint256 amount) payable external {
      require(address(this).balance >= amount, "Insufficient Funds");
      transactionCount += 1;
      transactions.push(TransferStruct(msg.sender,receiver, amount, block.timestamp));
      emit Transfer(msg.sender,receiver, amount, block.timestamp);
      receiver.transfer(amount);
   }

   function getAllTransactions() public view returns(TransferStruct[] memory){
      return transactions;
   }

   function getTransactionCount() public view returns(uint256){
      return transactionCount;
   }

}
