# Funding Smart Contract (Chainlink Price Feed Demo)

This project demonstrates how to use **Chainlink Price Feeds** in Solidity to fetch real-time **ETH/USD** data and perform on-chain ETH to USD conversion.

---

## 🔍 Overview
The goal of this project is to understand how smart contracts can use **oracles** to access real-world data.  
In this example, the contract:
- Fetches the **current ETH/USD price** using Chainlink’s `AggregatorV3Interface`.
- Converts any ETH amount to its **USD equivalent**.
- Sets a **minimum deposit requirement** (e.g., $5 worth of ETH).
- Includes simple deposit and withdrawal functions for testing purposes.

> ⚠️ This project is for learning purposes only. It doesn’t include reentrancy protection or full security logic.

---

## 🧠 What I Learned
- How to import and use **Chainlink price feed contracts**.
- How to convert ETH value to USD using live on-chain data.
- How `msg.value` and `msg.sender` work in deposit and withdrawal functions.
- The role of **events** for transaction logging.

---

## 🧩 Contract Address Used
**ETH/USD Price Feed (Sepolia Testnet)**  
`0x694AA1769357215DE4FAC081bf1f309aDC325306`

---

## 🧰 Tech Stack
- **Solidity** `^0.8.7`
- **Chainlink AggregatorV3Interface**
- **Remix IDE** (or local environment)

---

## 🧪 Example Functions
```solidity
function getPrice() public view returns (uint256)
function getConversion(uint256 ethAmount) public view returns (uint256)
function deposit() public payable
function withdawal(uint256 amount) public

