// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IBridge {
    function lock(address token, uint256 amount, uint256 targetChainId) external;
    function unlock(address user, address token, uint256 amount) external;
}
