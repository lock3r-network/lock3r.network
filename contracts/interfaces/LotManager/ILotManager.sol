// SPDX-License-Identifier: MIT
pragma solidity >=0.6.8;

import '../HegicPool/IGovernable.sol';
import '../HegicPool/ICollectableDust.sol';
import '../HegicPool/IHegicStaking.sol';

import './ILotManagerMetadata.sol';

interface ILotManager is 
  IGovernable,
  ICollectableDust,
  ILotManagerMetadata {
    
  // Governance events
  event ETHReceived(address from, uint amount);
  event FeeSet(uint256 withdrawFee);
  event PoolSet(address newPool, address newToken);
  event HegicStakingSet(address eth, address wbtc);
  event RewardsClaimed(uint256 rewards, uint256 fees);
  event LotManagerMigrated(address newPool);

  event Unwound(uint256 amount);

  event ETHLotBought(uint256 amount);
  event WBTCLotBought(uint256 amount);
  event ETHLotSold(uint256 amount);
  event WBTCLotSold(uint256 amount);

  function hegicStakingETH() external view returns (IHegicStaking);
  function hegicStakingWBTC() external view returns (IHegicStaking);
  function lotPrice() external view returns (uint256);
  function getPool() external view returns (address);
  function balanceOfUnderlying() external view returns (uint256);
  function balanceOfLots() external view returns (uint256 eth, uint256 wbtc);
  function setPool(address pool) external;
  function setFee(uint256 fee) external;
  function setHegicStaking(address _hegicStakingETH, address _hegicStakingWBTC) external;
  function sellLots(uint256 eth, uint256 wbtc) external returns (bool);
  function migrate(address newLotManager) external;
  function buyLots(uint256 eth, uint256 wbtc) external returns (bool);
  function unwind(uint256 amount) external returns (uint256 total);
  function claimRewards() external returns (uint256);
}