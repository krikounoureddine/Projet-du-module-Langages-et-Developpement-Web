document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('header');
    
    if (header) {
        fetch('./composant/header.html')  
            .then(response => response.text())  
            .then(data => {
                header.innerHTML = data;  

                // Maintenant que le contenu de header.html est chargé, nous pouvons charger le nombre du panier
               
            })
            .catch(error => console.error('Erreur de chargement du header:', error));
    } else {
        console.error('La balise <header> est introuvable.');
    }

    
});
