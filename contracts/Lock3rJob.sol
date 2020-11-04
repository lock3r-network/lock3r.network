// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "./interfaces/Lock3r/ILock3rHelper.sol";
import "./interfaces/Lock3r/ILock3r.sol";
import "./interfaces/UniOracleFactory.sol";

contract Lock3rJob {
    UniOracleFactory constant JOB = UniOracleFactory(0x61da8b0808CEA5281A912Cd85421A6D12261D136);
    ILock3r constant LKR = ILock3r(0x1837335798cd33D908951F6fAc8a0eB0cA231c14);
    ILock3rHelper constant KPRH = ILock3rHelper(0x0);
    // TODO: Add whitelist for approved contracts (worth paying for)
    // TODO: Get context values to know how much is a better value to pay out
    function update(address tokenA, address tokenB) external {
        require(LKR.isKeeper(msg.sender), "Lock3rJob::update: not a valid keeper");
        JOB.update(tokenA, tokenB);
        LKR.workReceipt(msg.sender, KPRH.getQuoteFor(1e18));
    }
}