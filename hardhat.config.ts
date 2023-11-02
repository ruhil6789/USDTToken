import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.0",
        // other compiler settings...
      },
      {
        version: "0.8.20",
        // other compiler settings...
      },

    ],
  }
}
export default config;
