#' xword_gen
#'
#' @param words character vector of words to put on grid
#' @param clues character vector of clues for words
#' @param tries number of tries to build script
#'
#' @export
#'
xword_gen <- function(words, clues = words, tries = 10){
  
  # push data to V8
  v8_env$v8$assign("words", words)
  v8_env$v8$assign("clues", clues)
  v8_env$v8$assign("tries", tries)
  
  # initiate new Crossword Object
  v8_env$v8$eval("var cw = new Crossword(words, clues);")
  
  # compute grid
  v8_env$v8$eval("var grid = cw.getSquareGrid(tries);")
  
  # retrieve result
  res <- 
    structure(
      v8_env$v8$get("grid", simplifyVector = FALSE),
      class = c("xword_js", "xword", "list")
    )
  
  # return
  res
}
