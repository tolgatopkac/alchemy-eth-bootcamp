async function deploy(abi, bytecode, signer, arbiter, beneficiary) {
  // 1. ContractFactory oluştur
  const factory = new ethers.ContractFactory(abi, bytecode, signer);

  // 2. Deploy fonksiyonunu çağır (constructor arguments + value)
  const deploymentPromise = factory.deploy(arbiter, beneficiary, {
    value: ethers.utils.parseEther("1.0"), // 1 ETH deposit
  });

  // 3. Promise'i return et
  return deploymentPromise;
}

module.exports = deploy;
