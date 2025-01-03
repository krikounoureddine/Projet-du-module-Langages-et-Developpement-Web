const map = L.map("map").setView([48.8566, 2.3522], 13); 
L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  maxZoom: 18,
  attribution: '© OpenStreetMap contributors'
}).addTo(map);

const greenManIcon = L.icon({
  iconUrl: './images/homme.png',  
  iconSize: [32, 32],            
  iconAnchor: [16, 32],          
  popupAnchor: [0, -32]          
});

const redIcon = L.icon({
  iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png', 
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
  shadowSize: [41, 41]
});


const pointsRouges = [
  { coords: [48.8566, 2.3522], popup: "Point 1 : Cathédrale Notre-Dame" },
  { coords: [48.8606, 2.3376], popup: "Point 2 : Musée du Louvre" },
  { coords: [48.853, 2.3499], popup: "Point 3 : Hôtel de Ville de Paris" },
  { coords: [48.8611, 2.3358], popup: "Point 4 : Place Vendôme" }
];

pointsRouges.forEach(point => {
  L.marker(point.coords, { icon: redIcon }).addTo(map)
    .bindPopup(point.popup)
    .openPopup();
});


let userMarker, destinationMarker, routeLayer;
let userLocation, destinationLocation;


navigator.geolocation.getCurrentPosition((position) => {
  userLocation = [position.coords.latitude, position.coords.longitude];
  map.setView(userLocation, 13);
  userMarker = L.marker(userLocation, { icon: greenManIcon }).addTo(map)
    .bindPopup("Vous êtes ici")
    .openPopup();
});

map.on("click", (e) => {
  destinationLocation = [e.latlng.lat, e.latlng.lng];
  if (destinationMarker) {
    map.removeLayer(destinationMarker);
  }
  destinationMarker = L.marker(destinationLocation).addTo(map)
    .bindPopup("Destination sélectionnée")
    .openPopup();
});

async function calculateRoute() {
  if (!userLocation || !destinationLocation) {
    alert("Veuillez sélectionner une destination sur la carte.");
    return;
  }

  const apiKey = "5b3ce3597851110001cf62487c44e398e4144dc4931b6673171ca13e"; 
  const mode = document.getElementById("mode").value;
  const start = `${userLocation[1]},${userLocation[0]}`; 
  const end = `${destinationLocation[1]},${destinationLocation[0]}`;
  const url = `https://api.openrouteservice.org/v2/directions/${mode}?api_key=${apiKey}&start=${start}&end=${end}`;

  try {
    const response = await fetch(url);
    const data = await response.json();

 
    const coordinates = data.features[0].geometry.coordinates.map(([lng, lat]) => [lat, lng]);
    if (routeLayer) {
      map.removeLayer(routeLayer);
    }
    routeLayer = L.polyline(coordinates, {
      color: "red",
      weight: 5,
      opacity: 0.8
    }).addTo(map);

    map.fitBounds(routeLayer.getBounds());

    const duration = data.features[0].properties.segments[0].duration;
    const minutes = Math.round(duration / 60);
    alert(`Temps estimé : ${minutes} minutes en ${mode.replace("-", " ")}`);
  } catch (error) {
    console.error("Erreur lors de la récupération :", error);
    alert("Erreur : Impossible de calculer l'itinéraire.");
  }
}