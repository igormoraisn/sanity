#!/usr/bin/wish

# Janela de visualização de informações sobre o software

wm resizable . 0 0
set x [expr {([winfo screenwidth .] - 520)/2}]
set y [expr {([winfo screenheight .] - 310)/2}]
wm title . "Sanity"
set texto "\n\n\n "
set entrada [open "README.md"]
set arquivo [read $entrada]
append texto $arquivo
frame .borda 
scrollbar .scroll -command ".problema yview" -orient v
text .texto -borderwidth 0 -yscrollcommand ".scroll set" -height 19 -width 71 -background gray86
.texto insert end $texto
.texto configure -state disable
button .voltar -text "Voltar" -command { destroy .  exit} -background white

grid .texto -in .borda -row 2 -column 1
#grid .scroll -in .borda -row 2 -column 2 -sticky ns
pack .borda
pack .voltar -padx 0 -pady 0 -side bottom
wm geometry . 520x302+$x+$y
