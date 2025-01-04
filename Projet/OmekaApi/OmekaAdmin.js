
        document.addEventListener('DOMContentLoaded', () => {
        const key_identity = 'F0YQydp2NA6Pn7u7HIa5fqE4NcMiRzNO'; 
        const key_credential = 'epaFJdFIIvMhnxt4kdpwRBzBSPDelCHG'; 

        const apiUrl = `http://localhost/omeka-s/api/items?key_identity=${key_identity}&key_credential=${key_credential}&pretty_print=1`;

        // Fonction pour recuperer des produits depuis omeka s 
        async function fetchAndDisplayData() {
          try {
            const response = await fetch(apiUrl);
            if (!response.ok) {
              throw new Error(`Erreur HTTP : ${response.status}`);
            }
            const data = await response.json();

            // le tableu qui contiendra les donnees recuperer depuis omka s 
            const tableBody = document.getElementById('product-table-body');

            // Nettoyer toujours
            tableBody.innerHTML = '';

            console.log(data);

            data.forEach(item => {
              if (item["@type"].includes("produit:Produit")) {
                console.log("Identifiant:", item["o:id"], "Titre:", item["o:title"], "Description:", item["dcterms:description"][0]["@value"], "Prix:", item["produit:prix"][0]["@value"]);

                // Creer un ligne 
                const row = document.createElement('tr');

                // ajout de colonnes 
                row.innerHTML = `
                  <td>${item["o:id"]}</td>
                  <td>${item["o:title"]}</td>
                  <td>${item["dcterms:description"] ? item["dcterms:description"][0]["@value"] : 'Non disponible'}</td>
                  <td>${item["produit:prix"] ? item["produit:prix"][0]["@value"] : 'Non défini'}</td>
                  <td>${item["produit:image_path"] ? item["produit:image_path"][0]["@value"] : 'Non défini'}</td>
                  <td> <button class="delete-button" data-id="${item["o:id"]}">Supprimer</button>
                  </td>
                `;

                // ajouter la ligne au tbody
                tableBody.appendChild(row);
              }
            });

            // evenement clique pour supprimer un produit partciuler et mettre a jour omeka s
            const deleteButtons = document.querySelectorAll('.delete-button');
            deleteButtons.forEach(button => {
              button.addEventListener('click', () => {
                const itemId = button.getAttribute('data-id');
                deleteItem(itemId);
              });
            });
          } catch (error) {
            console.error('Erreur :', error);

            // je dois travailler ca d'avantages 
            const tableBody = document.getElementById('product-table-body');
            tableBody.innerHTML = '<tr><td colspan="7">Une erreur est survenue lors du chargement des données.</td></tr>';
          }
        }



        // Ajout un evenement pour lajout de donnes sur omeka grace a lapi 
        // ajouter un items dans omeka s 
        document.getElementById('productForm').addEventListener('submit', async function(event) {
            event.preventDefault(); // empecher la soumission par défaut

            const productName = document.getElementById('productName').value;
            const description = document.getElementById('description').value;
            const price = document.getElementById('price').value;
            const quantity = document.getElementById('quantity').value;
            const pathFolder = document.getElementById('path_folder').value;


            // l'objet de données pour l'item d'un produit 
            const itemData = {
                "o:resource_class": { "o:id": 118 }, // le numero de la clase dans mon omeka s 
                "o:resource_template": { "o:id": 3 },
                "@type": [ "o:Item", "produit:Produit"], // ajout de la cle type produit 
                "o:title": productName,
                "produit:identifiant": [
                    {
                        "property_id": 221,
                        "property_label": "Identifiant",
                        "@value": "1", // sa n'affecte rien pcq pour chq item omek incremente auto l'id
                        "type": "literal"
                    }
                ],
                "dcterms:title": [
                    {
                        
                        "property_id": 1,
                        "property_label": "Title",
                        "@value": "iphone 15",
                        "type": "literal"
                    }
                ],
                "dcterms:description": [
                    {
                        "property_id": 4,
                        "property_label": "Description",
                        "@value": description,
                        "type": "literal"
                    }
                ],
                "produit:prix": [
                    {
                        "property_id": 223,
                        "property_label": "Prix",
                        "@value": price,
                        "type": "literal"
                    }
                ],
                "produit:quantite": [
                    {
                        "property_id": 224,
                        "property_label": "Quantité",
                        "@value": quantity,
                        "type": "literal"
                    }
                ],
                "produit:image_path": [
                    {
                        "property_id": 226,
                        "property_label": "Chemin de l'image",
                        "@value": pathFolder,
                        "type": "literal"
                    }
                ]
            };
           
            try {
                // POST vers l'API Omeka S
                const response = await fetch(apiUrl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(itemData)
                   
                });

                //  vérifie la réponse 
                if (response.ok) {
                    const data = await response.json();
                    alert("Produit ajouté avec succès !");
                    fetchAndDisplayData(); 
                    console.log(data); // affiche le resutlat dans le consale de la requete 
                } else {
                    alert("Erreur lors de l'ajout du produit");
                    console.error("Erreur : " + response.status);
                }
            } catch (error) {
                console.error('Erreur lors de l\'ajout du produit :', error);
                alert("Une erreur s'est produite.");
            }
        });


        // Fonction pour supprimer un item via l'API Omeka
        async function deleteItem(itemId) {
          const apiDeleteUrl = `http://localhost/omeka-s/api/items/${itemId}?key_identity=${key_identity}&key_credential=${key_credential}`;
          
          try {
            const response = await fetch(apiDeleteUrl, {
              method: 'DELETE',
            });
            
            if (response.ok) {
              alert('Item supprimé avec succès!');
              fetchAndDisplayData();  // rafraichir  les donnees apres suppression
            } else {
              throw new Error(`Erreur lors de la suppression : ${response.status}`);
            }
          } catch (error) {
            console.error('Erreur de suppression:', error);
            alert('Une erreur est survenue lors de la suppression de l\'item.');
          }
        }

        // Appelez la fonction pour recuperer les donnees
        fetchAndDisplayData();
      });
