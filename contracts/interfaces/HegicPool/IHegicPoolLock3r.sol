// SPDX-License-Identifier: MIT

pragma solidity >=0.6.8;

interface IHegicPoolLock3r {
  event HegicPoolSet(address hegicPool);
  event Lock3rSet(address Lock3r);
  event MinRewardsSet(uint256 _minETHRewards, uint256 _minWBTCRewards);

  // Actions by keeper
  event RewardsClaimedByKeeper(uint256 rewards);

  // Actions forced by governor
  event ForcedClaimedRewards(uint256 rewards);

  // Manager
  event LotsBought(uint256 eth, uint256 wbtc);
  event PendingManagerSet(address pendingManager);
  event ManagerAccepted();

  // Setters
  function setHegicPool(address _hegicPool) external;
  function setMinRewards(uint256 _minETHRewards, uint256 _minWBTCRewards) external;
  function setLock3r(address _Lock3r) external;
  // Lock3r actions
  function workable() external view returns (bool);
  function claimRewards() external;
  // Governor keeper bypass
  function forceClaimRewards() external;
  // HegicPool Manager
  function buyLots(uint256 _eth, uint256 _wbtc) external;
  function setPendingManager(address _pendingManager) external;
  function acceptManager() external;
}