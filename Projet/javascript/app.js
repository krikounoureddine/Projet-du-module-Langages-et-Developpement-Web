import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.outputColorSpace = THREE.SRGBColorSpace;
renderer.setSize(window.innerWidth * 0.5, window.innerHeight * 1); // 50% largeur et 80% hauteur
renderer.setClearColor(0x1a1a1a); // Couleur de fond gris foncé pour plus de contraste
renderer.setPixelRatio(window.devicePixelRatio);
renderer.shadowMap.enabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap;
document.body.appendChild(renderer.domElement);


// Création de la scène
const scene = new THREE.Scene();

// Ajout d'une lumière ambiante
const ambientLight = new THREE.AmbientLight(0xf9f8f6, 0.5); // Lumière douce et uniforme
scene.add(ambientLight);

// Configuration de la caméra
const camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 1000);
// Ajuster la position de la caméra pour qu'elle soit plus proche du modèle
camera.position.set(3, 3, 5); // Plus proche du modèle

// Contrôles pour naviguer dans la scène
const controls = new OrbitControls(camera, renderer.domElement);
controls.enableDamping = true;
controls.enablePan = false;
controls.zoomSpeed = 2;
controls.minDistance = 2; // Permet de se rapprocher plus près du modèle
controls.maxDistance = 3; // Distance maximale de la caméra
controls.minPolarAngle = 0; // Permet de voir le modèle de bas en haut
controls.maxPolarAngle = Math.PI; // Permet de voir le modèle de bas en haut (rotation complète sur l'axe vertical)
controls.autoRotate = true;
controls.autoRotateSpeed = 1.0;
controls.target = new THREE.Vector3(0, 0.5, 0);
controls.update();


// Ajout d'une lumière directionnelle
const spotLight = new THREE.SpotLight(0xffffff, 1.5, 100, 0.5, 0.7);
spotLight.position.set(0, 25, 0);
spotLight.castShadow = true;
spotLight.shadow.bias = -0.0001;
scene.add(spotLight);

// Chargement du modèle GLTF
const loader = new GLTFLoader().setPath('./models/');
loader.load('scene.gltf', (gltf) => {
  console.log('Chargement du modèle...');
  const mesh = gltf.scene;

  // Activer les ombres pour les sous-éléments du modèle
  mesh.traverse((child) => {
    if (child.isMesh) {
      child.castShadow = true;
      child.receiveShadow = true;
    }
  });

  // Ajuster la position et l'échelle du modèle
  mesh.position.set(0, 0.5, 0);
  mesh.scale.set(1.5, 1.5, 1.5);
  scene.add(mesh);

  // Cacher la barre de chargement
  document.getElementById('progress-container').style.display = 'none';
}, (xhr) => {
  console.log(`Chargement : ${xhr.loaded / xhr.total * 100}%`);
}, (error) => {
  console.error('Erreur de chargement du modèle :', error);
});

// Redimensionner la scène si la fenêtre change
window.addEventListener('resize', () => {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
  renderer.setSize(window.innerWidth, window.innerHeight);
  renderer.setClearColor(0x808080); // Gris clair
});

// Animation de la scène
function animate() {
  requestAnimationFrame(animate);
  controls.update();
  renderer.render(scene, camera);
}

animate();
