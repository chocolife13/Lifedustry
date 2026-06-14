# u need to allow "allow-external-apps = true" in ~/.termux/termux.properties
# and termux-setup-storage
zip -0 -r /storage/emulated/0/game.love *
termux-open /storage/emulated/0/game.love