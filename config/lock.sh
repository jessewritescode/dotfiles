#!/bin/sh

B='#EBCB8B00'  # blank
C='#EBCB8B22'  # clear ish
D='#88C0D0cc'  # default
T='#ECEFF4ee'  # text
W='#BF616Abb'  # wrong
V='#EBCB8Bbb'  # verifying

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
\
--screen 1            \
--blur 5              \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
