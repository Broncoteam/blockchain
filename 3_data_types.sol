// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract myGame{
    /*
    uint public constant myUint =1;
    int public myInt = -1;
    string public myString = "myString";
    bool public myBool = true;
    */
    uint public playerCount = 0;
    //1*Player[] public players;
    mapping (address => Player) public players;

    enum Level {Novice, Intermediate, Advanced}

    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        //1*players.push(Player(firstName, lastName));
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName);
        playerCount += 1;
    }

    function getPlayerLevel(address playerAddress) public view returns(Level){
        return players[playerAddress].playerLevel;
    }
}
