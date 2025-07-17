const Block = require("./Block");

class Blockchain {
  constructor() {
    const genesisBlock = new Block("Genesis Block");
    this.chain = [genesisBlock];
  }

  addBlock(block) {
    const previousBlock = this.chain[this.chain.length - 1];
    block.previousHash = previousBlock.toHash();

    this.chain.push(block);
  }

  isValid() {
    for (let i = 1; i < this.chain.length; i++) {
      const currentBlock = this.chain[i];
      const previousBlock = this.chain[i - 1];

      if (
        currentBlock.previousHash.toString() !==
        previousBlock.toHash().toString()
      ) {
        return false;
      }
    }

    return true;
  }
}

module.exports = Blockchain;
