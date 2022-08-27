// contracts/TOTE.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TOTE is ERC20 {
    constructor(uint256 initialSupply) ERC20("Tote DAO Token", "TOTE") {
        _mint(msg.sender, initialSupply);
    }

    function mintMinerReward(uint256 amount) public {
        _mint(block.coinbase, amount);
    }
}
