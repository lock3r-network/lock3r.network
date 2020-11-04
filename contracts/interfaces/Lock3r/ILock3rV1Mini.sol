//SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;
interface ILock3rV1Mini {
    function isLocker(address) external returns (bool);
    function worked(address keeper) external;
}