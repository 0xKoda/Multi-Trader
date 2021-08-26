pragma solidity ^0.8.0;

IUniswapV2Router02 private constant sushiRouter = IUniswapV2Router02(0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506);
address private constant INJ = 0x9108Ab1bb7D054a3C1Cd62329668536f925397e5;

function _tradeOnSushi(uint256 amountIn, uint256 amountOutMin, uint256 deadline) private {
    address recipient = address(this);
      
    sushiRouter.swapExactTokensForTokens(
        amountIn,
        amountOutMin,
        _getPathForSushiSwap(),
        recipient,
        deadline
    );
}

function _getPathForSushiSwap() private pure returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = BNT;
    path[1] = INJ;
    
    return path;
}