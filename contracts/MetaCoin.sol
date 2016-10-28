pragma solidity ^0.4.2;

import "./ConvertLib.sol";

/**
@title MetaCoin Interface
@author Author Here
@dev TODO update solidity compiler to add user/dev notes
*/
contract MetaCoin {

	// TODO update solidity compiler to support variable definitions
	mapping (address => uint) balances;

	// TODO update solidity compiler to support events
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	// TODO update solidity compiler to support constructor
	function MetaCoin() {
		balances[tx.origin] = 10000;
	}

	/**
	@notice Transfer coins from sender to receiver
	@dev
		This is just a simple example of a coin-like contract.
		It is not standards compatible and cannot be expected to talk to other
		coin/token contracts. If you want to create a standards-compliant
		token, see: [ConsenSys/Tokens](https://github.com/ConsenSys/Tokens). Cheers!
	@param receiver Address of the receipient
	@param amount Amount of tokens to send
	@return { "sufficient": "Transfer is succesful" }
	*/
	function sendCoin(address receiver, uint amount) returns (bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		Transfer(msg.sender, receiver, amount);
		return true;
	}

	/**
	@notice Returns equivalent Ether balance for a given address
	@dev Uses the `ConvertLib.sol` library for conversions
	@param addr Queried address
	@return { "value" : "Ether equivalent balance of account" }
	*/
	function getBalanceInEth(address addr) returns(uint value){
		return ConvertLib.convert(getBalance(addr),2);
	}
	/**
	@notice Returns MetaCoin balance for a given address
	@param addr Queried address
	@return { "value" : "Token balance of account" }
	*/
	function getBalance(address addr) returns(uint value) {
		return balances[addr];
	}
}
