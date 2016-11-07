pragma solidity ^0.4.2;

/**
@title Some Other Library
@author Gav Wouldn't
*/
library MyLib{
	/**
	@notice Converts given value to Ether value
	@param amount Token amount
	@param conversionRate Rate of conversion - Tokens -> Ether
	@return { "convertedAmount" : "Ether equivalent amount" }
	*/
	function convert(uint amount, uint conversionRate) returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}
