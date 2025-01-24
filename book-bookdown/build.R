install.packages("bookdown")
library(bookdown)

bookdown::render_book("index.Rmd",
  "bookdown::epub_book",
  output_dir = "_book/EPUB",
  clean = T
)
