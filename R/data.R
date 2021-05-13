#' Lexical decision data
#'
#' Lexical decision data from the British Lexicon Project (Keuleers et al., 2012)
#'
#' @format A data frame with 25,401 rows 
#' \describe{
#'   \item{\code{Word}}{word}
#'   \item{\code{RT}}{average lexical decision latency in the BLP}
#'   \item{\code{Length}}{length of the word in letters}
#'   \item{\code{logFrequency}}{log-transformed frequency of the word}
#'   \item{\code{logOLD20}}{log-transformed average Levenshtein distance between a word its 20 closest orthographic neighbors}
#'   \item{\code{SND20}{average cosine similarity between a word and its 20 closest semantic neighbors}
#' }
#' 
#' @source Keuleers, E., Lacey, P., Rastle, K., & Brysbaert, M. (2012). The British Lexicon 
#' Project: Lexical decision data for 28,730 monosyllabic and disyllabic English words. 
#' Behavior Research Methods, 44(1), 287-304.
"ld"

#' Word naming data
#'
#' Word naming data from the English Lexicon Project (Balota et al., 2007)
#'
#' @format A data frame with 37,107 rows 
#' \describe{
#'   \item{\code{Word}}{word}
#'   \item{\code{RT}}{average naming latency in the ELP}
#'   \item{\code{Length}}{length of the word in letters}
#'   \item{\code{logFrequency}}{log-transformed frequency of the word}
#'   \item{\code{logOLD20}}{log-transformed average Levenshtein distance between a word its 20 closest orthographic neighbors}
#'   \item{\code{SND20}{average cosine similarity between a word and its 20 closest semantic neighbors}
#' }
#' 
#' @source Balota, D. A., Yap, M. J., Hutchison, K. A., Cortese, M. J., Kessler, B., Loftis, B., ... 
#' & Treiman, R. (2007). The English lexicon project. Behavior Research Methods, 39(3), 445-459.
"nam"


#' Picture naming data
#'
#' Picture naming data  (Bates et al., 2003)
#'
#' @format A data frame with 484 rows 
#' \describe{
#'   \item{\code{Word}}{word}
#'   \item{\code{RT}}{average naming latency in the ELP}
#'   \item{\code{Length}}{length of the word in letters}
#'   \item{\code{logFrequency}}{log-transformed frequency of the word}
#'   \item{\code{logOLD20}}{log-transformed average Levenshtein distance between a word its 20 closest orthographic neighbors}
#'   \item{\code{SND20}{average cosine similarity between a word and its 20 closest semantic neighbors}
#' }
#' 
#' @source Székely, A., D’amico, S., Devescovi, A., Federmeier, K., Herron, D., Iyer, G., ... & Bates, E. (2003). 
#' Timed picture naming in seven languages. Bates, E., D'Amico, S., Jacobsen, T., Szekely, A., 
#' Andonova, E., et al. (2003). Psychonomic Bulletin & Review, 10(2), 344-380.
"pn"
