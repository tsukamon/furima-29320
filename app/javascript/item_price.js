window.addEventListener('load', function(){
  
  const price = document.getElementById("item-price");
  let tax = 0.1
  let taxPrice = document.getElementById("add-tax-price")
  let priceContent = document.getElementById("profit")

  price.addEventListener('input', function (){
  taxPrice.innerHTML = price.value * tax
  priceContent.innerHTML = price.value - price.value * tax
  });
});