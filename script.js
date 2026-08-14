// On vérifie si l'appareil est tactile / petit écran
const isMobile = window.innerWidth < 768;

if (!isMobile) {
  document.addEventListener('mousemove', (e) => {
    // 1. On calcule la position de la souris par rapport au centre de l'écran
    const xRatio = (e.clientX / window.innerWidth) - 0.5;
    const yRatio = (e.clientY / window.innerHeight) - 0.5;
    
    // 2. On réduit l'effet (ex: 30px au lieu de 500px pour que ça reste subtil)
    const moveX = xRatio * 30; 
    const moveY = yRatio * 30;
    
    // 3. On injecte les valeurs dans le CSS
    document.documentElement.style.setProperty('--bg-x', `${moveX}px`);
    document.documentElement.style.setProperty('--bg-y', `${moveY}px`);
  });
}