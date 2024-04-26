// File: modules/Blue20Module.js

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("Blue20Module", (m) => {
  const token = m.contract("Blue20", ["BLU20", "BLU20", 10000]);

  return { token };
});
