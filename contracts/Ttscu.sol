// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
contract Ttscu is ReentrancyGuard{
      //state variable
      address owner;

     //key-value-mapping
      mapping(string => address) public whiteListedTokens;
      mapping(address => mapping(string => uint256)) accountBalances;


    //defining events emitted in below methods for logging purposes
    event Deposited(address indexed payee, uint256 amount);
    event Withdrawn(address indexed payee, uint256 amount);


    //determining the owner of contract
    constructor(){
        owner = msg.sender;
    }


     /////////////////////
    // Main Functions //
    /////////////////////

    //specifying the allowed tokens in a whitlist provided and updated by the owner of the contract
    function whiteListToken(string memory symbol, address tokenAddress) external{
        require(msg.sender == owner,"This function is not public");
        whiteListedTokens[symbol] = tokenAddress;
    }

     // external caller sends amount of erc20 token to the smart contract
    function deposit(uint256  amount, string memory symbol) external payable  nonReentrant{
    //  uint256 value;   
     accountBalances[msg.sender][symbol] += amount;
     ERC20(whiteListedTokens[symbol]).transferFrom(msg.sender, address(this),amount);
     emit Deposited(msg.sender, amount);
    }

     // withdrawing an amount of token from the smart contract by the caller
    function withdraw(uint256 amount, string memory symbol) external {
     require(accountBalances[msg.sender][symbol] >= amount,'Insufficent funds');
     uint256 balance;
     accountBalances[msg.sender][symbol] -= amount;
     ERC20(whiteListedTokens[symbol]).transfer(msg.sender, amount);
     emit Withdrawn(msg.sender,balance);
    }

}