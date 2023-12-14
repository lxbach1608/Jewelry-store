document.addEventListener("DOMContentLoaded", function (e) {
//  const url1 = "http://localhost:8080/JewelryStore/api/products";
    const url1 = "https://jewelrystore.onrender.com/JewelryStore/api/products";

//  const url2 = "http://localhost:8080/JewelryStore/api/products/promotion";
    const url2 = "https://jewelrystore.onrender.com/JewelryStore/api/products/promotion";


  const productsApi = fetch(url1).then((response) => response.json());
  const productsOnPromotionApi = fetch(url2).then((response) => response.json());
  
  var listProducts = [];

  // Define showSuggestions outside of Promise.all
  function showSuggestions() {
    const input = document.getElementById("search-input");
    const suggestionsContainer = document.getElementById("suggestions-container");
    const searchModel = document.querySelector(".search-model");
    suggestionsContainer.innerHTML = ''; 
    
    searchModel.classList.remove("hidden");
    
    suggestionsContainer.addEventListener("mouseleave", (e) => {
        searchModel.classList.add("hidden");
    });
    
    const inputValue = input.value.toLowerCase();
    
    

    const suggestions = listProducts;
    
    const filteredSuggestions = suggestions.filter((option) =>
      option.toLowerCase().includes(inputValue)
    );

    filteredSuggestions.forEach((option) => {
      const suggestionItem = document.createElement("li");

        suggestionItem.innerHTML = option;
        
        suggestionItem.addEventListener('click', () => {
            suggestionsContainer.innerHTML = ''; 
        });

      suggestionsContainer.appendChild(suggestionItem);
    });
    
    if(filteredSuggestions.length <= 0) {
        const noProduct = document.createElement("li");
        noProduct.innerHTML = "<h3>No Product show</h3>";
        
        suggestionsContainer.innerHTML = '';
       
        suggestionsContainer.appendChild(noProduct);
    }
    
    if(inputValue.length == 0) {
        console.log(inputValue.length);
        suggestionsContainer.innerHTML = ''; 
    }

  }

  Promise.all([productsApi, productsOnPromotionApi])
    .then((data) => {
      const [products, productsOnPromotion] = data;
      
      listProducts = products.map((element, index) => {
        const isOnPromotion = productsOnPromotion.some(
          (promoProduct) => promoProduct.productId === element.productId
        );

        return {
          ...element,
          isOnPromotion: isOnPromotion && true
        };
        
      });
      console.log(listProducts);
      
      listProducts = listProducts.map((element, index) => {
          return `<a href="https://jewelrystore.onrender.com/JewelryStore/products/details/${element.slug}?id=${element.productId}" class="w-100">
                            <div class="flex">
                                <img class="search-img" src="${element.imageUrl}"/>
                                <div class="w-100">
                                    <p class="search-text">${element.name}</p>
                                    <div class="price-wrapper text-right flex justify-between align-center mb-0">
                                        <span class="category-lable">Bands</span>
                                        ${element.isOnPromotion ? `<div class="price-wrapper text-right">
                                            <span class="old-price">$ ${element.price}.00</span>
                                            <span class="new-price">$ ${element.price * 0.8}.00</span>
                                        </div>` : `<div class="price-wrapper mt-0"><span class="product-price text-green text-semibold text-right block">$ ${element.price}.00</span></div>`}
                                    </div>
                                </div>
                            </div>
                          </a>`;
      });
    })
    .catch((error) => {
      console.error("Error fetching data:", error);
    });
    

  const inputElement = document.getElementById("search-input");
  inputElement.addEventListener("input", showSuggestions);
});
