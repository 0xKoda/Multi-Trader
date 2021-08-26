pragma solidity ^0.8.0;

import './BancorSwap.sol';
import './SushiSwap.sol';
import './UniSwap.sol';


contract Multiswap is 

constructor() {
  IERC20(BNT).safeApprove(address(sushiRouter), type(uint256).max);
  IERC20(INJ).safeApprove(address(uniswapRouter), type(uint256).max);
}
function multiSwap(uint256 deadline, uint256 amountOutMinUniswap) external payable {
    uint256 amountOutMinBancor = 1;
    uint256 amountOutMinSushiSwap = 1;

    _tradeOnBancor(msg.value, amountOutMinBancor);
    _tradeOnSushi(IERC20(BNT).balanceOf(address(this)), amountOutMinSushiSwap, deadline);
    _tradeOnUniswap(IERC20(INJ).balanceOf(address(this)), amountOutMinUniswap, deadline);
}
// meant to be called as view function
function multiSwapPreview() external payable returns(uint256) {
    uint256 daiBalanceUserBeforeTrade = IERC20(DAI).balanceOf(msg.sender);
    uint256 deadline = block.timestamp + 300;
    
    uint256 amountOutMinBancor = 1;
    uint256 amountOutMinSushiSwap = 1;
    uint256 amountOutMinUniswap = 1;
    
    _tradeOnBancor(msg.value, amountOutMinBancor);
    _tradeOnSushi(IERC20(BNT).balanceOf(address(this)), amountOutMinSushiSwap, deadline);
    _tradeOnUniswap(IERC20(INJ).balanceOf(address(this)), amountOutMinUniswap, deadline);
    
    uint256 daiBalanceUserAfterTrade = IERC20(DAI).balanceOf(msg.sender);
    return daiBalanceUserAfterTrade - daiBalanceUserBeforeTrade;
}