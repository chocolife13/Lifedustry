# Android  
<br>


## Setup termux for download update and push Lifedustry

### Download termux
[Download Termux from github](https://github.com/termux/termux-app/releases) <br>
[Download Termux from f-droid](https://f-droid.org/en/packages/com.termux/) <br>
[Download Termux from playstore (not recomemded)](https://play.google.com/store/apps/details?id=com.termux)

### setup termux
in termux type <br>
` pkg update `  For update the list of packet can be installed <br>
` pkg upgrade `  For update packed who can be <br>
` pkg i git `  For install "git" the project manager <br>
` git clone https://github.com/chocolife13/Lifedustry.git `  For clone the project into a Folder name Lifedustry <br>
To go inside the folder Lifedustry
` cd ./Lifedustry `  Change Directory to the folder name Lifedustry in the actual folder (./ = actual folder)


## launching Lifedustry as native android app (recomended)

### install love2D app
[Download Love2D from github](https://github.com/love2d/love/releases/)


### start lifedustry
in the folder
` chmod +x ./android_launcher.sh `  Allow execution of this script chmod is permision file manager and +x is to add eXecution permision
` ./android_launcher.sh ` Run the script for android (if you want u can see inside if u don't trust)

### update Lifedustry
in the folder
` git pull ` to pull the project from github

## laucnhing Lifedustry in termux x11


###











## download love 2D
You should be able to download it with your packet manager:

Android ([termux](https://github.com/LinuxDroidMaster/Termux-Desktops/blob/main/Documentation/native/termux_native.md))
 `pkg i git`
 `pkg i love`

## Download the repo or Clone the repo
### for downloading
<a href="src/scene/test.lua"><img src="/docs/tutorial_github_download_repo.png" alt="Screenshot" width="450"></img></a>

### for Cloning with git
make sure you have Git downloaded
`git clone https://github.com/chocolife13/Lifedustry.git`
 


## Run lifedustry
now go to the lifedustry folder and in a terminal type 
`love ./`
