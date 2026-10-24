
library(testthat)
library(haamR)

test_that("identical observations have zero distance", {
  x <- c(10, 20, 1)

  expect_equal(
    haam_distance(
      x = x,
      y = x,
      num_indices = c(1, 2),
      feature_weights = c(1, 0.5)
    ),
    0
  )
})

test_that("calculates the expected weighted distance", {
  x <- c(10, 20, 1)
  y <- c(12, 25, 0)

  expected <- sum(c(1, 0.5) * log1p(c(2, 5)))

  expect_equal(
    haam_distance(
      x = x,
      y = y,
      num_indices = c(1, 2),
      feature_weights = c(1, 0.5)
    ),
    expected
  )
})

test_that("ignores features not selected", {
  x <- c(10, 20, 1)
  y <- c(12, 25, 100)

  result <- haam_distance(
    x = x,
    y = y,
    num_indices = c(1, 2),
    feature_weights = c(1, 0.5)
  )

  expect_equal(
    result,
    sum(c(1, 0.5) * log1p(c(2, 5)))
  )
})

test_that("rejects observations of different lengths", {
  expect_error(
    haam_distance(
      x = c(1, 2),
      y = c(1, 2, 3),
      num_indices = 1,
      feature_weights = 1
    ),
    "same length"
  )
})
