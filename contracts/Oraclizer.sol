pragma solidity ^0.4.21;

import "../ethereum-api/oraclizeAPI_0.5.sol";


contract Oraclizer is usingOraclize {
    OraclizeAddrResolverI private OAR;
    string public GBP;

    function Oraclizer() public {
        OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
    }

    function updateGBP() public payable {
        oraclize_query("URL", "json(http://api.fixer.io/latest?symbols=USD,GBP).rates.GBP");
    }

    function __callback(bytes32 myid, string result) public {
        require(msg.sender == oraclize_cbAddress());
        GBP = result;
    }
}
