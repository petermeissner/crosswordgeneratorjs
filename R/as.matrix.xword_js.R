#' as.matrix.xword_js
#'
#' @param x data to transformed
#' @param ... not used, just here for mirroring generic
#'
#' @export
as.matrix.xword_js <- function(x, ...){
  
  # extract character from list of lists
  tmp <- 
    lapply(
      X   = x, 
      FUN = 
        function(x){
          vapply(
            X = x, 
            FUN = 
              function(x){
                tmp <- x$char 
                if ( is.null(tmp) ) {
                  return("")
                } else {
                  return(tmp)
                }
              },
            FUN.VALUE = character(1)
          )
        }
    )
  
  # rbind to matrix and return
  do.call(rbind, tmp)
}
