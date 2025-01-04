  
  document.addEventListener('DOMContentLoaded', () => {
  
        const currentUrl = window.location.href;
        const urlParams = new URLSearchParams(window.location.search);
        // Récupérer la valeur de l'ID
        const id = urlParams.get('id');
        
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

            console.log(data);

            data.forEach(item => {
              if (item["@type"].includes("produit:Produit") && item["o:id"]==id) {

                const titreElement = document.getElementById('titre');
                const prix = document.getElementById('prix');
                const prixancien = document.getElementById('ancienprix');
                const tranche = document.getElementById('tranche');
                const economie = document.getElementById('economie');

              
                titreElement.innerHTML = '';
                prix.innerHTML = '';
                tranche.innerHTML = '';
                prixancien.innerHTML = '';
                economie.innerHTML = '';

                // Ajouter le nouveau contenu
                titreElement.innerHTML = `
                  ${item["o:title"]} - ${item["produit:prix"][0]["@value"]} € ${item["dcterms:description"][0]["@value"]}`;
                prixp=parseInt(item["produit:prix"][0]["@value"])
                prix.innerHTML = `${prixp} €`;
                tranche.innerHTML = `${Math.floor(prixp/3).toFixed(2)}  €`;
                prixancien.innerHTML = `${(prixp*1.25)} € neuf`;
                economie.innerHTML = `Économisez ${(prixp*1.25)-(prixp)}  €`;
                

                console.log("Identifiant:", item["o:id"], "Titre:", item["o:title"], "Description:", item["dcterms:description"][0]["@value"], "Prix:", item["produit:prix"][0]["@value"]);

              }
            });

           
          } catch (error) {
            console.error('Erreur :', error);

            // je dois travailler ca d'avantages 
          
            cosole.log("Une erreur est survenue lors du chargement des données.</td></tr>';")
          }
        }

        fetchAndDisplayData()
    

    
  })