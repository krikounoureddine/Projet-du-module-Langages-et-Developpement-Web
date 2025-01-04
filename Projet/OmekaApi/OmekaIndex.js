document.addEventListener('DOMContentLoaded', () => {
    const key_identity = 'F0YQydp2NA6Pn7u7HIa5fqE4NcMiRzNO';
    const key_credential = 'epaFJdFIIvMhnxt4kdpwRBzBSPDelCHG';
  
    const apiUrl = `http://localhost/omeka-s/api/items?key_identity=${key_identity}&key_credential=${key_credential}&pretty_print=1`;
  
    // var glo
    let products = [];
    const itemsPerPage = 35;
    let currentPage = 1;
  
    // recuperer les produits depuis omeka_s
    async function fetchAndDisplayData() {
      try {
        const response = await fetch(apiUrl);
        if (!response.ok) {
          throw new Error(`Erreur HTTP : ${response.status}`);
        }
        const data = await response.json();
  
        // filtrer les produits et les structurer
        products = data
          .filter(item => item["@type"].includes("produit:Produit"))
          .map(item => ({
            id: item["o:id"],
            name: item["o:title"] || 'Nom non défini',
            description: item["dcterms:description"] ? item["dcterms:description"][0]["@value"] : 'Description non disponible',
            price: item["produit:prix"] ? item["produit:prix"][0]["@value"] : 'Prix non défini',
            image: './images/phone.jpg'
          }));
  
        displayProducts(currentPage);
      } catch (error) {
        console.error('Erreur lors de la récupération des données :', error);
      }
    }
  
    // affichage des produits
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
          <img src="${product.image}" class="product-image" alt="${product.name}" style="display: block; margin: 0 auto;">
          <h3>${product.name}</h3>
          <p>${product.description}</p>
          <p>Prix : ${product.price} €</p>
          <div class="stars" data-product="${product.id}">
            <span>&#9733;</span>
            <span>&#9733;</span>
            <span>&#9733;</span>
            <span>&#9733;</span>
            <span>&#9733;</span>
          </div>
        `;  
           // voir les details du protuits
           const productImageElement = productElement.querySelector('.product-image');
           productImageElement.addEventListener('click', () => {
               // Redirection vers les produits
               window.location.href = `Produit.html?id=${product.id}`;
           });
     
        productContainer.appendChild(productElement);
      });
  
      updatePagination(page);
    }
  
    // Fonction pour mettre à jour la pagination
    function updatePagination(page) {
      const totalPages = Math.ceil(products.length / itemsPerPage);
      document.getElementById('prev').disabled = page === 1;
      document.getElementById('next').disabled = page === totalPages;
    }
  
    // Gestion des boutons de pagination
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
  
    fetchAndDisplayData();
  });
  