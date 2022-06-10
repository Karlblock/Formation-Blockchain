pragma solidity 0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Voting is Ownable {

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

 function addWhiteListVoter (address _voter) external onlyOwner{
        require(workflowStatus == WorkflowStatus.RegisteringVoters, 'cannot add new voters');
        require(!Voters[_voter].isRegistered, "The voter is already registered");
        require(_voter != owner(),"The Owner don't participate");

        Voters[_voter].isRegistered = true;
        Voters[_voter].hasVoted = 0;
        emit registerVote(Voters[_voter]);
    }

    function startProposals() external onlyOwner{

    }


    function voterAddProposal(string memory _description) external onlyVoter{

    }


    function endProposals() external onlyOwner{


    }


    function startVote() external onlyOwner{


    }
 

    function vote(uint _proposalId) external onlyVoter{

    }


    function endVote() external onlyOwner{

    }



}

