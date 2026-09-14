// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {ERC1155} from "../lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {IVerifier} from "./Verifier.sol";

contract Panagram is ERC1155 , Ownable {
    IVerifier public verifier;
    event NewRound(bytes32 indexed answer);

    constructor(address _verifier) Ownable(msg.sender) ERC1155("https://lavender-peculiar-quail-256.mypinata.cloud/ipfs/bafybeiahvgoxuguf3nypz4caykemjaa7s5aaaqv7mnahdsz52neeqgoowe/{id}.json") {
        verifier = IVerifier(_verifier);
    }

function setVerifier(address _verifier) external onlyOwner {
        require(_verifier != address(0), "Verifier address cannot be zero");
        verifier = IVerifier(_verifier);
    }

    function newRound(bytes32 _answer) external onlyOwner{
        bytes32 s_answer = _answer;
        emit NewRound(_answer);

    }

   
}