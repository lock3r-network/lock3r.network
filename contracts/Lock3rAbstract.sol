// SPDX-License-Identifier: MIT

pragma solidity >=0.6.8;

import './interfaces/Lock3r/ILock3rV1.sol';

abstract
contract Lock3r {

  ILock3rV1 public Lock3r;

  constructor(address _Lock3r) public {
    _setLock3r(_Lock3r);
  }

  function _setLock3r(address _Lock3r) internal {
    // require(keccak256(bytes(ILock3rV1(_Lock3r).name())) == keccak256(bytes('Lock3rV1')), 'pool-keeper::set-Lock3r:not-Lock3r');
    Lock3r = ILock3rV1(_Lock3r);
  }

  function _isKeeper() internal {
    require(Lock3r.isKeeper(msg.sender), "::isKeeper: keeper is not registered");
  }

  // Only checks if caller is a valid keeper, payment should be handled manually
  modifier onlyKeeper() {
    _isKeeper();
    _;
  }

  // Checks if caller is a valid keeper, handles default payment after execution
  modifier paysKeeper() {
    _isKeeper();
    _;
    Lock3r.worked(msg.sender);
  }
}