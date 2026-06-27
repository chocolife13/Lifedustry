document.addEventListener('mousemove', (e) => {
  // 1. On calcule la position de la souris par rapport au centre de l'écran
  // (Donne une valeur entre -0.5 et 0.5)
  const xRatio = (e.clientX / window.innerWidth) - 0.5;
  const yRatio = (e.clientY / window.innerHeight) - 0.5;
  
  // 2. On multiplie par le nombre de pixels maximum de déplacement souhaité (ex: 30px)
  const moveX = xRatio * 500; 
  const moveY = yRatio * 500;
  
  // 3. On injecte les valeurs directement dans le CSS
  document.documentElement.style.setProperty('--bg-x', `${moveX}px`);
  document.documentElement.style.setProperty('--bg-y', `${moveY}px`);
});