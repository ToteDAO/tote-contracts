//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./TOTE.sol";
import "./TUSD.sol";

contract ToteDAO {
    address payable[] users;
    address payable[] companies;
    mapping(string => string[]) BountiesAndReviews;
    mapping(string => uint) HelpfulReviews;
    mapping(string => address) ReviewAndItsMaker;

    function addNewUser(address payable _newUser)
        public
        returns (bool addNewUserStatus)
    {
        users.push(_newUser);
        emit NewUserJoined(_newUser);
        return true;
    }

    function addNewCompany(address payable _newCompany)
        public
        returns (bool addNewCompanyStatus)
    {
        companies.push(_newCompany);
        emit NewCompanyAdded(_newCompany);
        return true;
    }

    function addNewBounty(string memory _bountyHash)
        public
        returns (bool addStatus)
    {
        emit NewBountyCreated(_bountyHash);
        return true;
    }

    function addReview(string memory _bountyHash, string memory _reviewHash)
        public
        returns (bool statusAddReview)
    {
        BountiesAndReviews[_bountyHash].push(_reviewHash);
        emit NewReviewAdded(_bountyHash, _reviewHash);
    }

    function addHelpfulReviews(string memory _reviewHash)
        public
        returns (bool addHelpfulReviewStatus)
    {
        HelpfulReviews[_reviewHash] += 1;
        emit ReviewHelpful(msg.sender, _reviewHash);
        return true;
    }

    event NewUserJoined(address _newUserAddr);
    event NewCompanyAdded(address _newCompanyAddr);
    event NewBountyCreated(string _bountyHash);
    event NewReviewAdded(string _bountyHash, string _reviewHash);
    event ReviewHelpful(address _user, string _reviewHash);
}
