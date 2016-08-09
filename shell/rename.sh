for fname in app/views/**/*.html.slim; do
  mv $fname ${fname%.html.slim}.slim
done}
