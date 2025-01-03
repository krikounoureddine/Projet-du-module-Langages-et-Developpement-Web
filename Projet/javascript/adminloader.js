document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('header');
    
    if (header) {
        fetch('../Projet/composant/adminheader.html')  
            .then(response => response.text())  
            .then(data => {
                header.innerHTML = data;  

                // Maintenant que le contenu de header.html est chargé, nous pouvons charger le nombre du panier
                loadCartCount();  
            })
            .catch(error => console.error('Erreur de chargement du header:', error));
    } else {
        console.error('La balise <header> est introuvable.');
    }

    // Fonction pour charger la valeur du panier depuis localStorage
    function loadCartCount() {
        const cartCountElement = document.querySelector('.cart-count');

        // Vérifiez si l'élément existe dans le DOM
        if (cartCountElement) {
            const savedCount = parseInt(localStorage.getItem('cartCount')) || 0;
            console.log('Valeur du panier sur cette page:', savedCount);
            cartCountElement.textContent = savedCount;
        } else {
            console.error('Élément avec la classe .cart-count non trouvé');
        }
    }
});
