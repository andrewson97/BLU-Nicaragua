// File: modules/Blue20Module.js

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("Blue20Module", (m) => {
  const token = m.contract("Blue20", []);

  return { token };
});
