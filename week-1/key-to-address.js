const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");

function keyToAddress(publicKey) {
  // remove the prefix byte (0x04) from the public key
  const slicedKey = publicKey.slice(1);

  const hash = keccak256(slicedKey);

  // take the last 20 bytes of the hash ( etherum address is 20 bytes long)
  const address = hash.slice(-20);
}

module.exports = {
  keyToAddress,
};
