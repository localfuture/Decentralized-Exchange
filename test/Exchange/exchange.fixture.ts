import { ethers } from "hardhat";

import type { MyToken } from "../../types/contracts/MyToken";
import type { MyToken__factory } from "../../types/factories/contracts/MyToken__factory";

import type { Exchange } from "../../types/contracts/Exchange";
import type { Exchange__factory } from "../../types/factories/contracts/Exchange__factory";

export async function deployLockFixture() {
  const [owner, address1, address2, address3] = await ethers.getSigners();

  const MyToken = (await ethers.getContractFactory(
    "MyToken"
  )) as MyToken__factory;
  const myToken = (await MyToken.connect(owner).deploy(
    "Token",
    "TKN",
    5
  )) as MyToken;
  const myToken_address = await myToken.getAddress();

  await myToken.connect(owner).mint(address1.address, 100000);
  await myToken.connect(owner).mint(address2.address, 100000);

  const Exchange = (await ethers.getContractFactory("Exchange")) as Exchange__factory;
  const exchange = (await Exchange.deploy(myToken_address)) as Exchange;
  const exchange_address = await exchange.getAddress();

  await myToken.connect(address1).approve(exchange_address, 100000);
  await myToken.connect(address2).approve(exchange_address, 100000);


  return {
    exchange,
    exchange_address,
    myToken,
    myToken_address,
    owner,
    address1,
    address2,
    address3
  };
}