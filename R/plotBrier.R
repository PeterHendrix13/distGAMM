#' Plot Brier
#'
#' Plot the Brier score
#' @param
#' pec A pec object, as created by pec()
#' @param
#' type "BS" for Brier score (default), "IBS" for integrated Brier score
#' 
#' @examples 
#' # Remove outliers
#' predictors = c("logFrequency", "Length", "logOLD20", "SND20") 
#' ld = removeOutliers(ld, predictors)
#' ld = na.omit(ld)
#' 
#' # Prepare data in exponential data format
#' ld$status = 1
#' cut_points = as.numeric(quantile(ld$RT[which(ld$RT <= 1085 & 
#'                ld$RT >= 500)],seq(0, 1, by = 0.02)))
#' ped = split_data(Surv(RT, status)~., data = ld, id = "id",
#'                    cut = cut_points)
#' 
#' # Run PAM (warning: computationally heavy)
#' pam_ld = pamm(ped_status ~ s(tend) + 
#'              s(logFrequency) + ti(tend, logFrequency) + 
#'              s(Length) + ti(tend, Length) + 
#'              s(logOLD20) + ti(tend, logOLD20) + 
#'              s(SND20) + ti(tend, SND20),
#'              data = ped)
#' 
#' # Generate prediction error curves
#' pec = pec(list(pam = pam_ld),
#'   Surv(RT, status) ~ 1,
#'   data = na.omit(ld),
#'   times = seq(510, 1080, length.out = 100),
#'   start = 510,
#'   exact = FALSE)
#'
#' # Plot Brier score
#' plotBrier(pec)
#'
#' # Plot integrated Brier score
#' plotBrier(pec, type = "IBS")
#' 
#' @export

# Plot Brier score        
plotBrier = function(pec, type = "BS", main = NA, xlab = NA, ylab = NA, ylim = NA, 
                     colors = c("#B33333", "#3333B3", "#33B333", "#B333B3", "#B37733"), 
                     lwd = 2, legend.names = NA, y.intersp = 1, ...) {

  xlabel = ifelse(is.na(xlab), "time (ms)", ylab)
  ylabel = ifelse(is.na(ylab), ifelse(type == "BS", "Brier score", "IBS"), ylab)
  mainlab = ifelse(is.na(main), ifelse(type == "BS", "Brier score", "IBS"), main)
  
  if(is.na(ylim)) { ylimit = c(0, 0.30) } else { ylimit = ylim }
    
  if (type == "IBS") {
    ibs.times = seq(min(pec$time), max(pec$time), length.out = 100)
    ibs = crps(pec, times = ibs.times)    
  }

  if(is.na(legend.names[1])) { 
      if(type == "BS") {
        leg.names = names(pec$AppErr)
      } else {
        leg.names = rownames(ibs)
      }
  } else {
    leg.names = legend.names
  }
      
  if (type == "BS") {
  
    plot(pec$time, pec$AppErr[[1]], type = "n", main = mainlab, xlab = xlabel, 
      ylab = ylabel, ylim = ylimit)
    
    for(i in 1:length(pec$AppErr)) {
      lines(pec$time, pec$AppErr[[i]], col = colors[i], lwd = lwd)
    }
  
    legend(x = max(pec$time), y = ylimit[2], legend = leg.names, xjust = 1, yjust = 1, 
      col = c("#B33333", "#3333B3", "#33B333"), lwd = lwd, bty = "n", y.intersp = y.intersp)
  
  } else {
  
    plot(ibs.times, ibs[1,], type =  "n", main = mainlab, xlab = xlabel, 
      ylab = ylabel, ylim = ylimit)
    
    for(i in 1:nrow(ibs)) {
      lines(ibs.times, ibs[i,], col = colors[i], lwd = lwd)
    }

    legend(x = max(ibs.times), y = ylimit[2], legend = leg.names, xjust = 1, yjust = 1, 
      col = c("#B33333", "#3333B3", "#33B333"), lwd = lwd, bty = "n", y.intersp = y.intersp)
    
  }
    
}
