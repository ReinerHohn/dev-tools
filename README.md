# dev-tools

Mit folgendem Befehl werden vom raspberry mit hostname "RASP1", Benutzer "pi" die raspberry-toolchain in den Ordenr rpi-toolch geclont, 
die Ordner /usr und /lib vom raspberry ge-rsynct, ein passendes Toolchainfile und ein Skript (gen-cmake-proj.sh), mit dem das als Argument 
angegebene cmake-Projekt direkt konfiguriert und compiliert werden kann.

Um andere Toolchains zu verwenden, muss ein Skript ähnlich zu "create-rpi-toolch.sh" erstellt werden.

#./do_all.sh pi RASP1 ~/rpi-toolch/

#./gen-cmake-proj.sh ~/bluez-exmaple/

