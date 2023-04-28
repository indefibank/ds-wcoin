pragma solidity >=0.4.23;

import "./wcoin9.sol";

contract DSWcoinFactory {
    event LogMake(address indexed creator, address token);

    function make() public returns (WCOIN9_ result) {
        result = new WCOIN9_();
        emit LogMake(msg.sender, address(result));
    }
}
