```mermaid
flowchart TD
    A[Accéder à la page d'accueil] --> B[Visualiser la liste ]
    B --> C{Recherche ou tri ?}
    C -->|Recherche| D[Entrer les critères de recherche]
    D --> E[Afficher les résultats de recherche]
    C -->|Trier| F[Choisir un critère de tri]
    F --> G[Afficher les projets triés]
    B --> H[Ajout de projets ]
    H --> I[Accéder au panier]
    B -->|Acheter| I[Accéder au panier]
    I --> J{Modifier le panier ?}
    J -->|Oui| K[Modifier / Ajouter / Supprimer des projets]
    J -->|Non| L{Finaliser la transaction ?}
    L -->|Oui| M[Demander connexion]
    M --> N[Authentifier l'utilisateur]
    N --> O{Authentification réussie ?}
    O -->|Oui| P[Valider la commande]
    P --> Q[Transaction chiffrée et cryptée]
    O -->|Non| R[Afficher un message d'erreur]
    L -->|Non| S[Continuer à naviguer]

    style A fill:#D4E157,stroke:#000,stroke-width:2px
    style B fill:#81D4FA,stroke:#000,stroke-width:2px
    style C fill:#FFCA28,stroke:#000,stroke-width:2px
    style D fill:#FFAB40,stroke:#000,stroke-width:2px
    style E fill:#A5D6A7,stroke:#000,stroke-width:2px
    style F fill:#FFABAB,stroke:#000,stroke-width:2px
    style G fill:#FF7043,stroke:#000,stroke-width:2px
    style H fill:#64B5F6,stroke:#000,stroke-width:2px
    style I fill:#B39DDB,stroke:#000,stroke-width:2px
    style J fill:#FFF176,stroke:#000,stroke-width:2px
    style K fill:#81C784,stroke:#000,stroke-width:2px
    style L fill:#FFD54F,stroke:#000,stroke-width:2px
    style M fill:#FF8A65,stroke:#000,stroke-width:2px
    style N fill:#D7CCC8,stroke:#000,stroke-width:2px
    style O fill:#B2DFDB,stroke:#000,stroke-width:2px
    style P fill:#A5D6A7,stroke:#000,stroke-width:2px
    style Q fill:#C5E1A5,stroke:#000,stroke-width:2px
    style R fill:#EF9A9A,stroke:#000,stroke-width:2px
    style S fill:#E1BEE7,stroke:#000,stroke-width:2px