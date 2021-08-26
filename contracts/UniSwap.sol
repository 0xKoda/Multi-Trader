pragma solidity ^0.8.0;

IUniswapRouter private constant uniswapRouter = IUniswapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);
address private constant DAI = 0xaD6D458402F60fD3Bd25163575031ACDce07538D;

function _tradeOnUniswap(uint256 amountIn, uint256 amountOutMin, uint256 deadline) private {
    address tokenIn = INJ;
    address tokenOut = DAI;
    uint24 fee = 3000;
    address recipient = msg.sender;
    uint160 sqrtPriceLimitX96 = 0;
    
    ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams(
        tokenIn,
        tokenOut,
        fee,
        recipient,
        deadline,
        amountIn,
        amountOutMin,
        sqrtPriceLimitX96
    );
    
    uniswapRouter.exactInputSingle(params);
    uniswapRouter.refundETH();
    
    // refund leftover ETH to user
    (bool success,) = msg.sender.call{ value: address(this).balance }("");
    require(success, "refund failed");
}
