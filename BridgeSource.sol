// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title BridgeSource
 * @dev Contract on the source chain to lock assets.
 */
contract BridgeSource is Ownable, ReentrancyGuard {
    event Locked(address indexed user, address indexed token, uint256 amount, uint256 chainId);
    event Unlocked(address indexed user, address indexed token, uint256 amount);

    constructor() Ownable(msg.sender) {}

    function lock(address _token, uint256 _amount, uint256 _targetChainId) external nonReentrant {
        require(_amount > 0, "Amount must be > 0");
        IERC20(_token).transferFrom(msg.sender, address(this), _amount);
        emit Locked(msg.sender, _token, _amount, _targetChainId);
    }

    function unlock(address _user, address _token, uint256 _amount) external onlyOwner nonReentrant {
        IERC20(_token).transfer(_user, _amount);
        emit Unlocked(_user, _token, _amount);
    }
}
