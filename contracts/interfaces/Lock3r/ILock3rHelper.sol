// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

interface ILock3rHelper {
    // Allows for variable pricing amounts
    function getQuoteFor(uint) external view returns (uint);
}