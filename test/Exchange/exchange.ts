import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { loadFixture, time } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers, network } from "hardhat";

import { Signers } from "../types";
import { deployLockFixture } from "./exchange.fixture";

describe("Exchange", function () {
  before(async function () {
    this.signers = {} as Signers;

    const signers = await ethers.getSigners();
    this.signers.admin = signers[0];

    this.loadFixture = loadFixture;
  });

  describe("Exchange test", function () {
    beforeEach(async function () {
      const { exchange, exchange_address, myToken, myToken_address, owner, address1, address2, address3 } =
        await this.loadFixture(deployLockFixture);

      this.exchange = exchange;
      this.exchange_address = exchange_address;
      this.myToken = myToken;
      this.myToken_address = myToken_address;
      this.owner = owner;
      this.address1 = address1;
      this.address2 = address2;
      this.address3 = address3;
    });

   it("", async function () {
    
   })
  });
});
