pragma solidity ^0.4.10;

import "./StandardToken.sol";
import "./Ownable.sol";

// Dr. Sebastian Buergel, Validity Labs AG
// wraps non-ERC20-conforming fundraising contracts (aka pure IOU ICO) in a standard ERC20 contract that is immediately tradable and usable via default tools.
// this is again a pure IOU token but now having all the benefits of standard tokens.
contract ERC20nator is StandardToken, Ownable {

    address public fundraiserAddress;

    uint constant issueFeePercent = 10; // fee in percent that is collected for all paid in funds

    event requestedRedeem(address indexed requestor, uint amount);
    
    event redeemed(address redeemer, uint amount);

    // fallback function invests in fundraiser
    // fee percentage is given to owner for providing this service
    // remainder is invested in fundraiser
    function() payable {
        uint issuedTokens = msg.value * (100 - issueFeePercent) / 100;

        // invest 90% into fundraiser
        if(!fundraiserAddress.send(issuedTokens))
            throw;

        // pay 10% to owner
        if(!owner.send(msg.value - issuedTokens))
            throw;
        
        // issue tokens by increasing total supply and balance
        totalSupply += issuedTokens;
        balances[msg.sender] += issuedTokens;
    }

    // allow owner to set fundraiser target address
    function setFundraiserAddress(address _fundraiserAddress) onlyOwner {
        fundraiserAddress = _fundraiserAddress;
    }

    // this is just to inform the owner that a user wants to redeem some of their IOU tokens
    function requestRedeem(uint amount) {
        requestedRedeem(msg.sender, amount);
    }

    // this is just to inform the investor that the owner redeemed some of their IOU tokens
    function redeem(uint amount) onlyOwner{
        redeemed(msg.sender, amount);
    }
}