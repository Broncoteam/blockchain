// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract myGame{
    uint public playerCount = 0;
    mapping (address => Player) public players;

    enum Level {Novice, Intermediate, Advanced}

    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName, block.timestamp);
        playerCount += 1;
    }

    function getPlayerLevel(address playerAddress) public view returns(Level){
        return players[playerAddress].playerLevel;
    }
}
