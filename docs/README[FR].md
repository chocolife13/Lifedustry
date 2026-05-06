<img src="/docs/Lifedustry_v2.svg" alt="Lifdustry" width="500"></img>
<br>
[![Typing SVG](https://readme-typing-svg.demolab.com?font=&pause=1000&color=6AC813&repeat=false&width=435&lines=Explore%2C+Build%2C+Fight;Contribue+to+lifedustry+now+!)](https://git.io/typing-svg)

[![Love2D](https://img.shields.io/badge/Framework-Love2D-blue?labelColor=%23e74a99&color=%2327aae1)](https://love2d.org) 
[![Lua](https://img.shields.io/badge/Powered%20by%20-%20Lua-%20blue?logo=lua&labelColor=%23000080&color=%230000F8)](https://www.lua.org/) 
[![Opensource](https://img.shields.io/badge/Open%20Source%20-%20grey?logo=Open%20Source%20Initiative&logoColor=%233DA639&labelColor=grey&color=%233DA639)](https://opensource.org/) 
[![GPLv3](https://img.shields.io/badge/GPLv3%20-%20%23BD0000?logo=GPLv3&logoSize=auto&labelColor=%23BD0000)](LICENSE)
![Last-Commit](https://img.shields.io/github/last-commit/chocolife13/lifedustry?style=flat-square&color=blue)
---------

Lifedustry est un RPG sandbox de type "bullet hell" en génération procédurale infinie. Il intègre différentes mécaniques comme des boss (similaires à ceux de Terraria, Undertale ou PixelQuest), des systèmes d'automatisation de ressources, de l'artisanat (crafting) et du butin (loot). C’est un jeu jouable en solo, en LAN ou en multijoueur en ligne. avec une vue 2D de dessus.


<a href="src/scene/test.lua"><img src="/docs/screenshot.png" alt="Screenshot" width="450"></img></a>

Capture d’écran de la scène de test

# Contribution
Si vous souhaitez contribuer, vous pouvez [lire les directives de contribution](CONTRIBUTING.md).

# Configuration minimale

GPU : OpenGL 2.1 ou OpenGL ES 2-capable graphics

Windows Vista x86 (32 Bits)

Windows XP nécessite l’installation de [OneCoreAPI](https://github.com/shorthorn-project/One-Core-API-Binaries)


# Guide de Configuration

### 1. Télécharger LÖVE 2D
## Windows
Pour les utilisateurs Windows, téléchargez-le sur le site officiel ici --> [love2d.org](https://love2d.org).
## Linux
Il devrait être disponible dans tout les gestionnaire de paquets, comme sur :

Arch 

 `sudo pacman -S love`
 
-----
 
 Debian ses couzin distro avec apt

 `sudo apt install love`

 ------
 
 Android ([termux et termux x11](https://github.com/LinuxDroidMaster/Termux-Desktops))

 `pkg i love`

-----

 
### 2. Télécharger le repo ou cloner le repo :
<a href="src/scene/test.lua"><img src="/docs/tutorial_github_download_repo.png" alt="Screenshot" width="450"></img></a>

 `git clone https://github.com/chocolife13/UndertaleLauncher.git`

### 5.Ouvrir Love2D avec le dossier principal en utilisant un terminal
## Windows
Pour les utilisateurs Windows, lancez love2D en spécifiant le dossier principal comme raccourci, placez ce dossier dans le répertoire de love.exe, puis ouvrez le terminal. Assurez-vous que Love2D figure dans votre variable d'environnement PATH :
1- Appuyez sur la touche Windows et tapez « env ». 2- Cliquez sur « Variables d'environnement ». 3- Sous « Variables système », double-cliquez sur « Path ». 4- Cliquez sur « Nouveau » et saisissez « C:\Program Files\love » (64 bits) ou « C:\Program Files (x86)\love » (32 bits).


/
Et pour les utulisateur sur linux

`love ./`



