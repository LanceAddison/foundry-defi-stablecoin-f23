// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.18;

// import {Test, console} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// // Have our invariant aka properties

// // What are our invariants(should always hold)?

// // 1. The total supply of DSC should be less than the total value of collateral

// // 2. Getter view functions should never revert <- evergreen invariant

// contract OpenInvariantsTest is StdInvariant, Test {
//     DSCEngine engine;
//     DecentralizedStableCoin dsc;
//     DeployDSC deployer;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     function setUp() public {
//         deployer = new DeployDSC();
//         (dsc, engine, config) = deployer.run();
//         (,, weth, wbtc,) = config.activeNetworkConfig();
//         targetContract(address(engine));
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         // get the value of all the collateral in the protocol
//         // copare it to all the debt (dsc)
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(engine));
//         uint256 totalWbtcDeposited = IERC20(wbtc).balanceOf(address(engine));

//         uint256 wethValue = engine.getUsdValue(weth, totalWethDeposited);
//         uint256 wbtcValue = engine.getUsdValue(wbtc, totalWbtcDeposited);

//         console.log("weth value: ", wethValue);
//         console.log("wbtc value: ", wbtcValue);
//         console.log("total supply: ", totalSupply);

//         assert(wethValue + wbtcValue >= totalSupply);
//     }
// }