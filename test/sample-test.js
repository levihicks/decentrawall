// const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Decentrawall", function () {
  it("deploys", async function () {
    const Decentrawall = await ethers.getContractFactory("Decentrawall");
    const decentrawall = await Decentrawall.deploy();
    await decentrawall.deployed();
  });
});
