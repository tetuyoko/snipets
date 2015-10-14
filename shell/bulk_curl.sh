#!/bin/bash

KINDS=(
minna-game.com
minna-game.net
minna-game.info
minage.net
minage.info
min-game.com
min-game.net
min-game.info
mina-game.net
mina-game.info
)

for KIND in $KINDS; do
  `curl -LI $KIND -o /dev/null -w '%{http_code}\n' -s -v`
done;
