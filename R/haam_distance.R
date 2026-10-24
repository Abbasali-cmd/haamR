
#' Compute HAAM Distance
#'
#' Computes a weighted logarithmic distance between the
#' numerical features of two observations.
#'
#' @param x Numeric vector representing observation 1.
#' @param y Numeric vector representing observation 2.
#' @param num_indices Integer indices of numerical features.
#' @param feature_weights Non-negative weight for each selected feature.
#'
#' @return A non-negative numeric distance.
#' @export
haam_distance <- function(x, y, num_indices, feature_weights) {
  if (!is.numeric(x) || !is.numeric(y)) {
    stop("x and y must be numeric vectors.")
  }

  if (length(x) != length(y)) {
    stop("x and y must have the same length.")
  }

  if (length(num_indices) == 0L ||
      anyNA(num_indices) ||
      any(!is.finite(num_indices)) ||
      any(num_indices != as.integer(num_indices)) ||
      any(num_indices < 1L | num_indices > length(x))) {
    stop("num_indices must contain valid feature indices.")
  }

  if (anyDuplicated(num_indices)) {
    stop("num_indices must not contain duplicates.")
  }

  if (length(feature_weights) != length(num_indices) ||
      !is.numeric(feature_weights) ||
      any(!is.finite(feature_weights)) ||
      any(feature_weights < 0)) {
    stop("Provide one finite, non-negative weight per selected feature.")
  }

  if (any(!is.finite(x[num_indices])) ||
      any(!is.finite(y[num_indices]))) {
    stop("Selected feature values must be finite.")
  }

  sum(feature_weights *
        log1p(abs(x[num_indices] - y[num_indices])))
}
