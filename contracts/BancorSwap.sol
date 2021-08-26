pragma solidity ^0.8.0;

IBancorNetwork private constant bancorNetwork = IBancorNetwork(0xb3fa5DcF7506D146485856439eb5e401E0796B5D);
address private constant BANCOR_ETH_ADDRESS = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
address private constant BANCOR_ETHBNT_POOL = 0x1aCE5DD13Ba14CA42695A905526f2ec366720b13;
address private constant BNT = 0xF35cCfbcE1228014F66809EDaFCDB836BFE388f5;

function _tradeOnBancor(uint256 amountIn, uint256 amountOutMin) private {
  bancorNetwork.convertByPath{value: msg.value}(_getPathForBancor(), amountIn, amountOutMin, address(0), address(0), 0);
}
  
function _getPathForBancor() private pure returns (address[] memory) {
    address[] memory path = new address[](3);
    path[0] = BANCOR_ETH_ADDRESS;
    path[1] = BANCOR_ETHBNT_POOL;
    path[2] = BNT;
    
    return path;
}
