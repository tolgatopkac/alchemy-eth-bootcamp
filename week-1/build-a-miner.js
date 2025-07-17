const SHA256 = require("crypto-js/sha256");
const TARGET_DIFFICULTY =
  BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
  // TODO: add transaction to mempool
  mempool.push(transaction);
}

function mine() {
  // Yeni blok oluştur
  const block = {
    id: blocks.length,
  };

  // Mempool'dan işlemleri al (MAX_TRANSACTIONS kadar)
  const transactions = [];
  const maxTxCount = Math.min(MAX_TRANSACTIONS, mempool.length);

  for (let i = 0; i < maxTxCount; i++) {
    const transaction = mempool.shift();
    transactions.push(transaction);
  }

  // İşlemleri bloğa ekle
  block.transactions = transactions;

  // Nonce'u başlat
  block.nonce = 0;

  // Proof of Work - TARGET_DIFFICULTY'den küçük hash bul
  let hash;
  let hashInt;

  do {
    // Bloğu stringify et
    const blockString = JSON.stringify(block);

    // SHA256 hash'ini hesapla
    hash = SHA256(blockString);

    // Hash'i BigInt'e çevir
    hashInt = BigInt(`0x${hash}`);

    // Eğer hash TARGET_DIFFICULTY'den büyük veya eşitse nonce'u artır
    if (hashInt >= TARGET_DIFFICULTY) {
      block.nonce++;
    }
  } while (hashInt >= TARGET_DIFFICULTY);

  // Hash'i bloğa ekle
  block.hash = hash;

  // Bloğu blocks dizisine ekle
  blocks.push(block);
}
module.exports = {
  TARGET_DIFFICULTY,
  MAX_TRANSACTIONS,
  addTransaction,
  mine,
  blocks,
  mempool,
};
