// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

interface ILock3r {
    function isLocker(address) external view returns (bool);
    function workReceipt(address keeper, uint amount) external;
}