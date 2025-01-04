document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('header');
    
    if (header) {
        fetch('./composant/adminheader.html')  
            .then(response => response.text())  
            .then(data => {
                header.innerHTML = data;  

          
            })
            .catch(error => console.error('Erreur de chargement du header:', error));
    } else {
        console.error('La balise <header> est introuvable.');
    }

});