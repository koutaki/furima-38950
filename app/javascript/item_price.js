window.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value);
    
    if (!isNaN(inputValue)) {
      const commission = Math.floor(inputValue * 0.1);
      const profit = inputValue - commission;
      
      addTaxDom.textContent = commission.toLocaleString() ;
      profitDom.textContent = profit.toLocaleString() ;
    } else {
      addTaxDom.textContent = "0円";
      profitDom.textContent = "0円";
    }
  });
});