// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";


contract Voting is Ownable {

    
    //winners :
    uint[] private winners;

    struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint votedProposalId;
    }

    struct Proposal {
        string description;
        uint voteCount;
    }

    enum WorkflowStatus {
        RegisteringVoters,
        ProposalsRegistrationStarted,
        ProposalsRegistrationEnded,
        VotingSessionStarted,
        VotingSessionEnded,
        VotesTallied
    }


    mapping(address => Voter) public voters;
     // all propositions : 
    Proposal[] public proposals;


    event WorkflowStatusChange(WorkflowStatus _previousStatus, WorkflowStatus _newStatus);    
    event VoterRegistered(address _voterAddress); 
    event ProposalRegistered(uint _proposalId);
    event Voted(address _voter, uint _proposalId);
    event VoterUnregistered(address voterAddress);

    // workflow initialisation :
    WorkflowStatus private voteStatus;

    

    modifier wlVoter() {
        require(voters[msg.sender].isRegistered, "Your are not is the WL");
        _;
    }

    // add voters to wl

    function addWhiteListVoter (address _voter) external onlyOwner{
        require(voteStatus == WorkflowStatus.RegisteringVoters, unicode"waiting on the register WL ended");
        // require(!voters[_voter].isRegistered, "you are already registered"); 
        // or   
        require(voters[_voter].isRegistered != true, "you are already registered");
        voters[_voter].isRegistered = true;
        emit VoterRegistered(_voter);
    }

    function delAddressFromWhitelist(address _address) external onlyOwner wlVoter(_address) {
        Proposal[_address].isRegistered = false;
        emit VoterUnregistered(_address);
    }

//  Quelques get pour infos

    function getStatus() external view returns (WorkflowStatus status) {
        return voteStatus;
    }

    function getProposals() external view returns(Proposal[] memory) {
        return proposals;

    }

    function getWinner() external view  returns(Proposal[] memory) {
        require(voteStatus == WorkflowStatus.VotesTallied,"the current workflow status does not allow you to get the winner");
        return proposals;
    }

// Status 

    function startProposals() external onlyOwner{
    require(voteStatus == WorkflowStatus.RegisteringVoters, "Registering proposals can't be started now");
    
    }


    function voterAddProposal(string memory _description) external wlVoter{
      
    }


    function endProposals() external onlyOwner{


    }


    function startVote() external onlyOwner{


    }
 

    function vote(uint _proposalId) external wlVoter{
        require(voteStatus == WorkflowStatus.VotingSessionStarted, "wait the vote office has started his day !");
    
    
    }


    function endVote() external onlyOwner{
        require(votestatus ==WorkflowStatus.VotingSessionStarted, "voting is not started");
    }



}