const secp = require("ethereum-cryptography/secp256k1");
const hashMessage = require("./hash-message");

async function recoverKey(message, signature, recoveryBit) {
  const hashMsg = hashMessage(message);
  secp.getPublicKey(secp.utils.randomPrivateKey());
  return secp.recoverPublicKey(hashMsg, signature, recoveryBit);
}

module.exports = recoverKey;
