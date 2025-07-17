function setMessage(contract, signer) {
  return contract.connect(signer).modify("This is a test message");
}
