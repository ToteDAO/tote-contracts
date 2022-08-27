// contracts/TUSD.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TUSD is ERC20 {
    constructor(uint256 initialSupply) ERC20("Tote USD", "TUSD") {
        _mint(msg.sender, initialSupply);
    }

    function mintMinerReward(uint256 amount) public {
        _mint(block.coinbase, amount);
    }
}
