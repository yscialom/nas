#!/bin/bash
test -f hello.all.js || curl -O https://raw.githubusercontent.com/MrSwitch/hello.js/master/dist/hello.all.js
python3 -m http.server 8080
