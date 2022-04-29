//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Decentrawall {
    bytes[2000][2000] public wall;

    struct WallPixel {
        uint x;
        uint y;
        uint r;
        uint g;
        uint b;
    }

    function set(WallPixel[] memory wp) public {
        require(wp.length <= 2000, "Invalid input array length.");
        for (uint i = 0; i < wp.length; i++) {
            require(wp[i].x < 2000 && wp[i].y < 2000, "Invalid coordinates.");
            require(wp[i].r <= 255 && wp[i].g <= 255 && wp[i].b <= 255, "Invalid color input.");
            wall[wp[i].x][wp[i].y] = abi.encodePacked(wp[i].r, wp[i].g, wp[i].b);
        }
    }
}
