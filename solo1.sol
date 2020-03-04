pragma solidity >=0.4.22 <0.7.0;

contract Escrow{
  address agent;
  mapping(address => uint256) public deposits;


  constructor() public {
    agent = msg.sender;
  }

  /// modifier is used for restriction check or the bound check
  modifier onlyAgent(){
    require(agent == msg.sender);
    _;
  }

  // public means the function can be called out side the contract means from out side the file;
  function deposite(address payee) public payable {
    uint256 amount = msg.value;
    deposits[payee]=deposits[payee]+amount;
  }

  function withdraw(address payable payee) public onlyAgent{
    uint256 payment = deposits[payee];
    deposits[payee]=0;
    payee.transfer(payment);

  }



}