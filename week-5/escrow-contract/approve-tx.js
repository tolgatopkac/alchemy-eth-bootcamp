async function approve(contract, signer) {
  // Contract'ı arbiter signer ile bağla ve approve fonksiyonunu çağır
  const txPromise = contract.connect(signer).approve();

  // Transaction promise'ini return et
  return txPromise;
}
module.exports = approve;
