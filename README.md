## Current Implementation

The `haam_distance()` function calculates a weighted logarithmic distance between two observations using selected numerical features.

The current implementation uses the following formula:

**Distance formula**

`d(x, y) = sum(w_j * log(1 + abs(x_j - y_j)))` for each selected feature `j` in `N`.

Where:

- \(x_j\) and \(y_j\) are the numerical values of feature \(j\) for observations \(x\) and \(y\).
- \(N\) is the set of selected numerical feature indices.
- \(w_j\) is the non-negative weight assigned to feature \(j\).
- \(\log\) is the natural logarithm.

The logarithmic transformation reduces the influence of larger absolute differences compared with an untransformed absolute-distance calculation.

**Note:** The current implementation calculates distances using numerical features only. Handling categorical variables within a unified distance measure remains a potential direction for future development.

## Example

The following example calculates the HAAM distance between two observations using their first and second features, with weights of 1 and 0.5, respectively.

```r
# Define two observations
x <- c(10, 20, 1)
y <- c(12, 25, 0)

# Select numerical features and assign weights
num_indices <- c(1, 2)
feature_weights <- c(1, 0.5)

# Calculate the HAAM distance
haam_distance(
  x = x,
  y = y,
  num_indices = num_indices,
  feature_weights = feature_weights
)
```

**Calculation**

For the selected features, the absolute differences are 2 and 5.
**Step 1: Apply the feature weights**

`d(x, y) = 1 * log(1 + 2) + 0.5 * log(1 + 5)`

**Step 2: Calculate the result**

`d(x, y) = log(3) + 0.5 * log(6) ≈ 1.9356`

The resulting distance is approximately **1.9356**. A distance of zero occurs when all selected feature values are equal or all corresponding weights are zero.

## Input Validation

The function checks that:

- `x` and `y` are numeric vectors of equal length.
- `num_indices` contains valid, unique feature indices.
- `feature_weights` contains one finite, non-negative weight per selected feature.
- Selected feature values are finite.

Invalid inputs produce an error message rather than a distance result.
