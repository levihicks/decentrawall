//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

/** @title A decentralized wall users paint on
 *  @author Levi Hicks
 */
contract Decentrawall {
    bytes[2000][2000] public wall;
    mapping(address => uint) public cooldownExpirations;

    struct WallPixel {
        uint row;
        uint col;
        uint r;
        uint g;
        uint b;
    }

    /** @dev paints a pixel on the decentrawall
     *  @notice there is a cooldown period of one hour until you can paint a new pixel
     *  @param wp contains row, column, and RGB values for pixel to paint
     */
    function paintPixel(WallPixel memory wp) public {
        require(wp.row < 2000 && wp.col < 2000, "Invalid coordinates.");
        require(wp.r <= 255 && wp.g <= 255 && wp.b <= 255, "Invalid color input.");
        require(
            cooldownExpirations[msg.sender] == 0 || cooldownExpirations[msg.sender] <= block.timestamp,
            "Cooldown period not yet passed."
        );
        wall[wp.row][wp.col] = abi.encodePacked(wp.r, wp.g, wp.b);
        cooldownExpirations[msg.sender] = block.timestamp + 1 hours;
    }
}
