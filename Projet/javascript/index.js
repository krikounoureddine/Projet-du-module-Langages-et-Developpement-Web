const products = Array.from({ length: 200 }, (_, i) => ({
    id: i + 1,
    name: `Telephone ${i + 1}`,
    image: './images/phone.jpg',
    }));

    const itemsPerPage = 35; 
    let currentPage = 1;


    function displayProducts(page) {

                const startIndex = (page - 1) * itemsPerPage;
                const endIndex = startIndex + itemsPerPage;
                const productsToDisplay = products.slice(startIndex, endIndex);

                const productContainer = document.getElementById('product-container');
                productContainer.innerHTML = '';

                productsToDisplay.forEach(product => {
                const productElement = document.createElement('div');
                productElement.classList.add('product');
                productElement.innerHTML = `
                <img src="${product.image}" alt="${product.name} style="display: block; margin: 0 auto"">
                <h3>${product.name}</h3>
                <div class="stars" data-product="2">
                <span>&#9733;</span>
                <span>&#9733;</span>
                <span>&#9733;</span>
                <span>&#9733;</span>
                <span>&#9733;</span>
                 </div>
    `;
  
    productElement.addEventListener('click', () => {
    
        window.location.href = `Produit.html?id=${product.id}`;
    });
    productContainer.appendChild(productElement);
});

updatePagination(page);
}

    function updatePagination(page) {
        const totalPages = Math.ceil(products.length / itemsPerPage);
        document.getElementById('prev').disabled = page === 1;
        document.getElementById('prev').classList.toggle('disabled', page === 1);
        document.getElementById('next').disabled = page === totalPages;
        document.getElementById('next').classList.toggle('disabled', page === totalPages);
    }

  
    document.getElementById('prev').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            displayProducts(currentPage);
        }
    });

    document.getElementById('next').addEventListener('click', () => {
        const totalPages = Math.ceil(products.length / itemsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            displayProducts(currentPage);
        }
    });

    displayProducts(currentPage);
    const starsContainers = document.querySelectorAll(".stars");

    starsContainers.forEach(container => {
        const stars = container.querySelectorAll("span");

        stars.forEach((star, index) => {
            star.addEventListener("click", () => {
                
                stars.forEach(s => s.classList.remove("selected"));

                
                for (let i = 0; i <= index; i++) {
                    stars[i].classList.add("selected");
                }

               
                const productId = container.getAttribute("data-product");
                const rating = index + 1; 

                console.log(`Produit ${productId} évalué à ${rating} étoiles.`);

                
                // fetch('/api/avis', {
                //     method: 'POST',
                //     headers: { 'Content-Type': 'application/json' },
                //     body: JSON.stringify({ productId, rating })
                // });
            });
        });
    });

    
    function openCart() {
        alert("Panier ouvert !");
    }
