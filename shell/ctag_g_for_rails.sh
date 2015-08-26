#!/bin/bash

ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .
