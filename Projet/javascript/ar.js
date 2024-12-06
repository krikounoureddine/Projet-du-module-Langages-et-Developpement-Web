import * as THREE from 'https://unpkg.com/three@v0.163.0/build/three.module.js';
    import { GLTFLoader } from 'https://unpkg.com/three@v0.163.0/examples/jsm/loaders/GLTFLoader.js';
    import { OrbitControls } from 'https://unpkg.com/three@v0.163.0/examples/jsm/controls/OrbitControls.js';
    function showARScene() {
      document.getElementById('augmented-reality-container').style.display = 'block';
      const renderer = new THREE.WebGLRenderer({ antialias: true });
      renderer.outputColorSpace = THREE.SRGBColorSpace;
      renderer.setSize(window.innerWidth*0.5, window.innerHeight*0.7);
      renderer.setClearColor(0x1a1a1a); 
      renderer.setPixelRatio(window.devicePixelRatio);
      renderer.shadowMap.enabled = true;
      renderer.shadowMap.type = THREE.PCFSoftShadowMap;
      document.getElementById('ar-canvas-container').appendChild(renderer.domElement);

      const scene = new THREE.Scene();
      const camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 1000);
      camera.position.set(3, 3, 5);

      const controls = new OrbitControls(camera, renderer.domElement);
      controls.enableDamping = true;
      controls.enablePan = false;
      controls.zoomSpeed = 2;
      controls.minDistance = 2;
      controls.maxDistance = 3;
      controls.autoRotate = true;
      controls.autoRotateSpeed = 1.0;
      controls.target = new THREE.Vector3(0, 0.5, 0);
      controls.update();

      const ambientLight = new THREE.AmbientLight(0xf9f8f6, 0.5);
      scene.add(ambientLight);

      const spotLight = new THREE.SpotLight(0xffffff, 1.5, 100, 0.5, 0.7);
      spotLight.position.set(0, 25, 0);
      spotLight.castShadow = true;
      scene.add(spotLight);

      const loader = new GLTFLoader().setPath('./models/');
      loader.load('scene.gltf', (gltf) => {
        const mesh = gltf.scene;
        mesh.traverse((child) => {
          if (child.isMesh) {
            child.castShadow = true;
            child.receiveShadow = true;
          }
        });

        mesh.position.set(0, 0.5, 0);
        mesh.scale.set(1.5, 1.5, 1.5);
        scene.add(mesh);
      });

      window.addEventListener('resize', () => {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
      });

      function animate() {
        requestAnimationFrame(animate);
        controls.update();
        renderer.render(scene, camera);
      }
      animate();
    }
    showARScene()