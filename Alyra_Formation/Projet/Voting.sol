// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "@openzeppelin/contracts/access/Ownable.sol";


contract Voting is Ownable {

    // all propositions : 
    Proposal[] private proposals;
    
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
    mapping (address => uint) CountVotes;


    event WorkflowStatusChange(WorkflowStatus _previousStatus, WorkflowStatus _newStatus);    
    event VoterRegistered(address _voterAddress); 
    event ProposalRegistered(uint _proposalId);
    event Voted(address _voter, uint _proposalId);

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

        voters[_voters].isRegistered = true;

        bnVoters++;

        emit VoterRegistered(_voter);
    }

    //  Quelques get pour infos

    function getStatus() external view returns (WorkflowStatus status) {
        return workflowStatus;
    }

    function getProposals() external view returns(Proposal[] memory) {
        return proposals;

    }

    function getWinner() extenral view returns( Proposal[] memory) {
        return proposals[_id];
    }

// Status 

    function startProposals() external onlyOwner{
    require(workflowStatus == WorkflowStatus.RegisteringVoters, "Registering proposals can't be started now");
    
    }


    function voterAddProposal(string memory _description) external onlyVoter{
      
    }


    function endProposals() external onlyOwner{


    }


    function startVote() external onlyOwner{


    }
 

    function vote(uint _proposalId) external onlyVoter{
        require(voteStatus == WorkflowStatus.VotingSessionStarted, "wait the vote office has started his day !");
    }


    function endVote() external onlyOwner{
        require(status ==WorkflowStatus.VotingSessionStarted, "voting is not started");
    }



}

