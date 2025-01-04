
document.getElementById('sort-select').addEventListener('change', function() {
    const sortValue = this.value;
    const rows = Array.from(document.querySelectorAll('#product-table-body tr'));

    rows.sort((rowA, rowB) => {
        let valA, valB;
        if (sortValue.includes('quantity')) {
            valA = parseInt(rowA.querySelector('.quantity').textContent);
            valB = parseInt(rowB.querySelector('.quantity').textContent);
        } else if (sortValue.includes('rating')) {
            valA = parseFloat(rowA.querySelector('.rating').textContent);
            valB = parseFloat(rowB.querySelector('.rating').textContent);
        } else if (sortValue.includes('votes')) {
            valA = parseInt(rowA.querySelector('.votes').textContent);
            valB = parseInt(rowB.querySelector('.votes').textContent);
        }

        if (sortValue.endsWith('asc')) {
            return valA - valB;
        } else {
            return valB - valA;
        }
    });

    // Revenir les lignes dans le bon ordre
    const tbody = document.getElementById('product-table-body');
    rows.forEach(row => tbody.appendChild(row));
});

        // Fonction pour afficher et masquer les formulaires
function toggleForm(formId) {
    const form = document.getElementById(formId);
    const overlay = document.getElementById('overlay');

    // Toggle visibility
    form.style.display = form.style.display === 'block' ? 'none' : 'block';
    overlay.style.display = overlay.style.display === 'block' ? 'none' : 'block';
}

// Ajouter un gestionnaire d'événements pour masquer le formulaire lorsqu'on clique en dehors
document.getElementById('overlay').addEventListener('click', function() {
    const form = document.querySelector('.form-container');
    form.style.display = 'none'; // Masque le formulaire
    this.style.display = 'none'; // Masque l'overlay
});

// Ajouter un gestionnaire d'événements pour les boutons "Ajouter un Produit" et "Ajouter une Catégorie"
document.getElementById('add-product-button').addEventListener('click', function() {
    toggleForm('product-form'); // Affiche le formulaire "Ajouter un Produit"
});

document.getElementById('add-category-button').addEventListener('click', function() {
    toggleForm('category-form'); // Affiche le formulaire "Ajouter une Catégorie"
});


