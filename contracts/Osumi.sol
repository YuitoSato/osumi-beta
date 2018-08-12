pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/BasicToken.sol";

contract Osumi is BasicToken {

    string public name = "Osumi-Beta";
    string public symbol = "OSM-Beta";

    constructor(uint256 initialSupply) public {
        totalSupply_ = initialSupply;
        balances[msg.sender] = initialSupply;
    }

}
