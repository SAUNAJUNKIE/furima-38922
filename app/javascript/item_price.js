window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const price = priceInput.value;
  const fee = Math.floor(price * 0.1);
  const profit = price - fee;
  const feeElement = document.getElementById("add-tax-price");
  const profitElement = document.getElementById("profit");
  feeElement.textContent = fee.toLocaleString();
  profitElement.textContent = profit.toLocaleString();
});
  
});