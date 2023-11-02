// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Matic is ERC20 {
    constructor() payable ERC20("Matic", "MATIC") {
        _mint(msg.sender, 50000);
    }

    // function mint(address sender, uint amount) public view returns (uint) {
    //     _mint(sender, amount);
    //     return amount;
    // }
}
