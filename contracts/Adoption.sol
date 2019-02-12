pragma solidity ^0.5.0;

contract Adoption {

	// an array of ethereum addresses of length 16
	// public vars have getter methods
	// arrays need keys
	address[16] public adopters;

	// Adopting a pet
	// type of params and return value must specified
	function adopt(uint petId) public returns (uint) {
		//set an assert -> makes sure it's not out of bounds
		require(petId >= 0 && petId <= 15);

		// msg.sender is the address of the 
		// person/smart contract calling the function
		adopters[petId]= msg.sender;

		// confirms index of adopted pet_id
		return petId;	
	}

	// Retrieving the adopters
	// need to update all adoption statuses
	// memory gives the data location for the variable
	// view means the function doesn't modify the state of the contract
	function getAdopters() public view returns (address[16] memory) {
	  return adopters;
	}

}