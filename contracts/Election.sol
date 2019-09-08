pragma solidity ^0.5.8;

contract Election{

	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}
	mapping(address => bool) public voters;
	mapping(uint => Candidate) public candidates;  //map function of candidate's details

	uint public candidatesCount;    //number of a candidates

	constructor () public{
		addCandidate("Candidate-1");
		addCandidate("Candidate-2");

	}

	function addCandidate(string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
	}

	function vote(uint _id) public{
		require(!voters[msg.sender]);
		require(_id>0 && _id<=candidatesCount);
		voters[msg.sender] = true;
		candidates[_id].voteCount++;
	}


}