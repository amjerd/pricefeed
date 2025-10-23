// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract Funding{
    uint256 public minimumUsd = 5 * (10 ** 18);
    mapping (address => uint256) public balance;

    event Deposited(address indexed user,uint256 amount);
    event withdraw(address indexed user,uint256 amount);

    function deposit()public payable{
        require(getConversion(msg.value) >= minimumUsd,"the amount must be equals to or greater tahn minimun");
        balance[msg.sender] += msg.value;

        emit Deposited(msg.sender, msg.value);


    } 

    function getPrice() public view returns (uint256) {
        //eth contract address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed =
            AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        
        (, int256 price, , , ) = priceFeed.latestRoundData();
        //Price of eth in terms of Usd
        return uint256(price * 1e10); // Convert 8 decimals to 18
    }

    function getConversion(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        //this line says PriceOfEth,18 zeros time EthAmount,18 zeros devide by 1,18 zeros
        //3240,000000000000000000 * 100000000000000000 / 100000000000000000
        //3240 = 1ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getRate() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function withdawal(uint256 amount)public {
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        (bool success,) = payable(msg.sender).call{value:amount}("");
        require(success,"withdrawal failed");
    }
}
