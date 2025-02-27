



#' Compute HAAM Distance
#'
#' @description Computes the Hybrid Abbas Ali Metric (HAAM) distance
#' between two numeric vectors.
#'
#' @param x Numeric vector (data point 1)
#' @param y Numeric vector (data point 2)
#' @param num_indices Numeric vector of indices of numerical features
#' @param feature_weights Numeric vector of feature-specific weights
#' @return Numeric value representing the HAAM distance
#' @export
haam_distance <- function(x, y, num_indices, feature_weights) {
  return(sum(feature_weights * log1p(abs(x[num_indices] - y[num_indices]))))
}







