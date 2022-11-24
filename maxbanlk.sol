// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Bank {
    
    mapping(address => uint256) public balanceOf;   // balances, indexed by addresses

    function deposit(uint256 amount) public payable {
        require(msg.value == amount , "you are broke");
        balanceOf[msg.sender] += amount;     // adjust the account's balance
    }

    function withdraw(uint256 amount) public payable{
        require(amount <= balanceOf[msg.sender], "not enough money in account");
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    function getMyBalance() public view returns( uint256 ){
        uint256 myBalance = balanceOf[msg.sender];
        return myBalance;
    }
    function bankBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
