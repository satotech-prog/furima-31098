window.addEventListener("DOMContentLoaded", () => {
 const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const inputValue = price.value;
    const Tax = 0.1;
    const taxplice = inputValue * Tax;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(taxplice);

    const taxplice2 = inputValue - taxplice;
    const addTaxDom2 = document.getElementById("profit");
    addTaxDom2.innerHTML = Math.floor(taxplice2);
  })
})