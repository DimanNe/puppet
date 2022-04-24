#!/bin/bash

# Create silence with sox -n -r 1 -c 2 silence.wav trim 0.0 1.0
# and put below base64 encoded version of silence:
# base64 silence.wav

while true
do
   /usr/bin/paplay <(/usr/bin/cat << END_OF_HEREDOC | /usr/bin/base64 -d
UklGRlAAAABXQVZFZm10ICgAAAD+/wIAAQAAAAgAAAAIACAAFgAgAAMAAAABAAAAAAAQAIAAAKoA
OJtxZmFjdAQAAAABAAAAZGF0YQgAAAAAAAAAAAAAAA==
END_OF_HEREDOC
)
   /usr/bin/sleep 1
done
