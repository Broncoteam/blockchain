// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract Coin{
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    modifier onlyMinter{
        require(msg.sender == minter, "Only minter can call this function");
        _;
    }

    modifier amountGreaterThan(uint amount){
        require(amount < 1e60);
        _;
    }

    modifier balanceGreaterThanAmount(uint amount){
        require(amount <= balances[msg.sender], "Insufficient balance.");
        _;
    }

    constructor(){
        minter = msg.sender;
    }

    function mint(address reciever, uint amount) public onlyMinter amountGreaterThan(amount){
        balances[reciever] += amount;
    }

    function send(address reciever, uint amount) public balanceGreaterThanAmount(amount){
        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Sent(msg.sender, reciever, amount);
    }
}

/*
modifier : işlevlerin davranışını bildirimsel bir şekilde değiştirmek için kullanılabilir. Örneğin, işlevin yürütülmesinden önce bir koşulun otomatik olarak kontrol edilmesi için bir değiştirici kullanabilirsiniz.
*/