#' Remove outliers
#'
#' Remove outliers from a data frame
#' @param
#' model A PAM model.
#' @param
#' data A data frame.
#' @param
#' predictors A vector of the column names in data corresponding to the predictors that outliers 
#' should be removed for
#' sd The number of standard deviations. Predictor values further than sd standard deviations 
#' from the predictor mean are removed. Default: 3.
#' 
#' @examples
#' # Load data for the lexical decision latencies in the British Lexicon Project (Keuleers et al, 2012)
#' data(ld)
#' 
#' # Remove outliers
#' ld = removeOutliers.fnc(ld, c("logFrequency","Length","logOLD20","SND20"))
#' ld = na.omit(ld)
#'
#' @export

# Remove outliers       
removeOutliers = function(data, predictors, sd = 3) {
  for(pred in predictors) {
    min = mean(data[,pred]) - sd*sd(data[,pred])
    max = mean(data[,pred]) + sd*sd(data[,pred])
    sel = which(data[,pred] < min | data[,pred] > max)
    data[sel,pred] = NA
  }
  return(data)
}
