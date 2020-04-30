#!/bin/sh

# delivery_form
grep -lr \
  'option v-for="n in 60" :value="numberWithPad(n)" {{ numWithP(n) }}' \
  ./app/views/* | \
  xargs sed -i.bak -e \
  's/{{ numberWithPad(n) }}/v-text="numrWithP(n)"/g'

# v-for message view
grep -lr \
  "v-for='message in " \
  ./app/views/ | \
  xargs sed -i.bak -e \
  's/{{ message }}/v-text="message"/g'

# v-for message js
grep -lr \
  'v-for="message in ' \
  ./app/assets/javascripts | \
  xargs sed -i.bak -e \
  's/{{ message }}/v-text="message"/g'

grep -lr \
  "v-for='message in " \
  ./app/assets/javascripts | \
  xargs sed -i.bak -e \
  's/>{{ message }}/ v-text="message">/g'

# v-for js
grep -lr \
  'option v-for' \
  ./app/assets/javascripts | \
  xargs sed -i.bak -e \
  's/>{{ option.text }}/ v-text="option.text">/g'

grep -lr \
  'v-for' \
  ./app/assets/javascripts | \
  xargs sed -i.bak -e \
  's/>{{ n + 1 }}/ v-text="n + 1">/g'
