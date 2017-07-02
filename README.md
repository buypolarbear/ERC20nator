# ERC20nator
wraps non-ERC20-conforming fundraising contracts (aka pure IOU ICO) in a standard ERC20 contract that is immediately tradable and usable via default tools

## Motivation
Tokens that are implemented as standardized blockchain-based smart contracts allow enable interoperability of trading tools and services. Yet several ICOs or fundraising events do not conform to the de-facto standard [ERC20 token interface](https://theethereum.wiki/w/index.php/ERC20_Token_Standard). This non-conformance does not let investors use standard tools or trade them via established (decentralized) exchanges. Here we provide a simple and minimal wrapper contract that makes these non-standard tokens ERC20 compatible.

## Tezos Fundraiser
The currently ongoing [Tezos fundraiser](https://www.tezos.com) is a simple [IOU](https://en.wikipedia.org/wiki/IOU) which does not do anothing else but collect Ether which can be collected by owners of the contract for whatever they wish to do with it. Despite the fact that their minimal fundraiser contract does not provide any true trustless, transparent or enforceable way of raising funds, the fundraising has so far collected millions of dollars in Ether alone.

We deployed this wrapper contract at address [0xd1b4fdf2fdeb790df015bf0b74bf43253b9ac2da](https://etherscan.io/address/0xd1b4fdf2fdeb790df015bf0b74bf43253b9ac2da). This lets investors easily invest into the Tezos fundraiser and receive transferrable ERC20 tokens in exchange. The smart contract collects a 2% fee and invests the remaining 98% of the Ether in the Tezos fundraiser.

We will do our best to make Tezos tokens available to investors of this smart contract. Tokens can be redeemed proportional to the investment amount held in tokens in this smart contract. When and how this will happen is to be determined after launch of Tezos and after distribution of their tokens.

## How To Use This Wrapper For The Tezos Fundraiser
You can simply send Ether to [0xd1b4fdf2fdeb790df015bf0b74bf43253b9ac2da](https://etherscan.io/address/0xd1b4fdf2fdeb790df015bf0b74bf43253b9ac2da) and will receive ERC20 tokens at that address. We subtract 2% of your contribution as fee and forward the rest to the Tezos fundraiser at address [0xb56d622ddf60ec532b5f43b4ff9b0e7b1ff92db3](https://etherscan.io/address/0xb56d622ddf60ec532b5f43b4ff9b0e7b1ff92db3). You can now directly transfer these second level IOU tokens to other accounts.

You can check the current contributions via this smart contract at Tezos address [tz1YKVsWdHvJ1EFJk6yzmzi1DSQzBGUMxmJZ](https://check.tezos.com/#tz1YKVsWdHvJ1EFJk6yzmzi1DSQzBGUMxmJZ).

## Why Is This A Bad Idea?!
Beyond the fact that the Tezos fundraiser smart contract is neither trustless, transparent nor enforceable we create a range of issues that you should be aware of before investing into this second-level contract:
 - This token is just another IOU ontop of the Tezos IOU
 - We hold the private key to the corresponding Tezos account to which Tezos will supposedly issue tokens
 - Our Tezos private key could become compromized and all tokens might be at risk
 - There is no guarantee in the code that investors will ever get anything back from us or Tezos
 - Maybe Tezos does not like the idea of this crowd pre-distribution and not give us any tokens
 
This is no investment advise, invest at your own risk and do not expect anything in return.
