pragma solidity ^0.5.0;

// gets assertion stuff
import "truffle/Assert.sol";
// gets the address of the deployed contract
import "truffle/DeployedAddresses.sol";
// smart contract that we want to test
import "../contracts/Adoption.sol";


contract TestAdoption {
	// address of the adoption contract to be tested
	Adoption adoption = Adoption(DeployedAddresses.Adoption());

	// id of pet for testing
	uint expectedPetId = 8;

	// address of expected owner
	address expectedAdopter = address(this);

	// testing adopt()
	function testUserCanAdoptPet() public {
		// calling adopt
		uint returnedId = adoption.adopt(expectedPetId);

		// assert the two are equal
		Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
	}

	// testing retrieval of a single pet's owner
	function testGetAdopterAddressByPetId() public {
		// calling adopters
		address adopter = adoption.adopters(expectedPetId);
		
		// assert petIds are equal
		Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
	}

	// testing retrieval of all pet owners
	function testGetAdopterAddressByPetIdInArray() public {
	  // Store adopters in memory rather than contract's storage
	  address[16] memory adopters = adoption.getAdopters();

	  Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
	}

}
