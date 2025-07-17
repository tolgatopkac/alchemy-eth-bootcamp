async function getValue(contract) {
  const number = await contract.value();
  return number;
}
