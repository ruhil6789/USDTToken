import { expect } from "chai";
import { ethers } from "hardhat";
import { USDT, USDT__factory, Ttscu, Ttscu__factory, Matic, Matic__factory } from "../typechain-types";


describe("Test case for allTokens", async () => {
    let signers;
    let owner: any
    let Matic: Matic
    let Ttscu: Ttscu
    let USDT: USDT

    let user1: any;
    let user2: any;
    let user3: any;



    beforeEach("before each ", async () => {
        signers = await ethers.getSigners();
        owner = signers[0];
        user1 = signers[1];
        user2 = signers[2];
        user3 = signers[3];


        Matic = await new Matic__factory(owner).deploy()
        console.log("-----balance", await Matic.balanceOf(owner.address));


        Ttscu = await new Ttscu__factory(owner).deploy()
        console.log(Ttscu.target, "Ttscu address");

        // console.log("token", await Matic.getAddress());
        // console.log("owner address ", owner.address);

    })

    //  amount is initialize at the time of deploy contract  ie 50000n as initialize in the constructor  of the  Matix.sol file
    it("mint token to user1", async () => {

        console.log("in the mint ");
        console.log("-----balance", await Matic.balanceOf(owner.address));

    })

    it("transfer token to user1 from owner", async () => {

        const user1Transfer = await Matic.transfer(user1.address, 20000)
        console.log(user1Transfer, "user1transfer");
        console.log("-----balance", await Matic.balanceOf(user1.address));

    }),
        it("should whitelist the token", async () => {
            //    const  MATICSYMBOL = await ethers.utils.formatBytes32String('Matic');
            // await utils.formatBytes32String('Matic')
            // const matic =String(abi.encodePacked()) 'Matic'

            const whitelist = await Ttscu.whiteListToken("Matic", Matic.target)
            console.log(whitelist, " whitelist the token");

        })

}