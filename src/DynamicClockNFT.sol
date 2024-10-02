// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

//have already deployed at 0x91303331dfeb93571f390901B63cbbD272B4529b at sepolia net

contract DynamicClockNFT is ERC721 {
    uint256 private _nextTokenId;

    constructor() ERC721("DynamicClockNFT", "DCLOCK") {}

    function mintClock() public returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        return tokenId;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Dynamic Clock #',
                        Strings.toString(tokenId),
                        '",',
                        '"description": "A clock animation",',
                        '"image": "',
                        generateClockSVG(),
                        '"}'
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function generateClockSVG() internal pure returns (string memory) {
        return string(abi.encodePacked("data:image/svg+xml;base64,", Base64.encode(bytes(generateClockSVGContent()))));
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }

    function _requireMinted(uint256 tokenID) internal view {
        require(_exists(tokenID), "ERC721:invalid token ID");
    }

    function generateClockSVGContent() internal pure returns (string memory) {
        return string(
            abi.encodePacked(
                '<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 300 300">',
                '<circle cx="150" cy="150" r="145" fill="white" stroke="black" stroke-width="5"/>',
                '<circle cx="150" cy="150" r="5" fill="black"/>',
                generateClockHands(),
                generateClockScript(),
                "</svg>"
            )
        );
    }

    function generateClockHands() internal pure returns (string memory) {
        return string(
            abi.encodePacked(
                '<line id="hour" x1="150" y1="150" x2="150" y2="75" stroke="black" stroke-width="6" stroke-linecap="round">',
                '<animateTransform attributeName="transform" type="rotate" from="0 150 150" to="360 150 150" dur="43200s" repeatCount="indefinite"/>',
                "</line>",
                '<line id="minute" x1="150" y1="150" x2="150" y2="50" stroke="black" stroke-width="4" stroke-linecap="round">',
                '<animateTransform attributeName="transform" type="rotate" from="0 150 150" to="360 150 150" dur="3600s" repeatCount="indefinite"/>',
                "</line>",
                '<line id="second" x1="150" y1="150" x2="150" y2="40" stroke="red" stroke-width="2" stroke-linecap="round">',
                '<animateTransform attributeName="transform" type="rotate" from="0 150 150" to="360 150 150" dur="60s" repeatCount="indefinite"/>',
                "</line>"
            )
        );
    }

    function generateClockScript() internal pure returns (string memory) {
        return string(
            abi.encodePacked(
                "<script>",
                "function updateClock() {",
                "  const now = new Date();",
                "  const hours = now.getHours() % 12;",
                "  const minutes = now.getMinutes();",
                "  const seconds = now.getSeconds();",
                '  document.getElementById("hour").setAttribute("transform", `rotate(${(hours + minutes/60) * 30} 150 150)`);',
                '  document.getElementById("minute").setAttribute("transform", `rotate(${minutes * 6} 150 150)`);',
                '  document.getElementById("second").setAttribute("transform", `rotate(${seconds * 6} 150 150)`);',
                "}",
                "setInterval(updateClock, 1000);",
                "updateClock();",
                "</script>"
            )
        );
    }
}
