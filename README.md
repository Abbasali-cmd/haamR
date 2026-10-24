# Hybrid Abbas Ali Metric (HAAM)

## Overview

**HAAM** is an experimental R package exploring a distance measure for datasets containing mixed numerical and categorical variables.

The project investigates how similarity between observations can be measured when a dataset includes different types of variables within a unified framework.

## Motivation

Real-world datasets often combine numerical measurements with categorical attributes. Traditional distance measures may require adjustments to accommodate these different data types.

HAAM explores an approach to measuring distances across mixed-type data, with the goal of supporting further experimentation in statistical analysis and data science.

## Technologies

- **R** — statistical computing and package development
- **Roxygen2** — function documentation
- **GitHub** — version control and project hosting

## Repository Structure

- `R/` — R source code
- `man/` — package documentation
- `DESCRIPTION` — package metadata and dependencies
- `NAMESPACE` — exported functions and namespace configuration
- `README.md` — project overview and documentation

## Current Status

HAAM is an experimental project under development. Its implementation, functionality, and methodology may evolve as the project progresses.

Please review the source code and package documentation for details about the current functions and their intended use.

## Future Development

Potential areas for further development include:

- Testing the metric on datasets containing mixed variable types
- Documenting assumptions, scaling, and variable-weighting choices
- Comparing results with established distance measures
- Adding automated tests and reproducible examples

These are potential development directions, not claims about currently implemented features.

## Author

Abbas Ali

## License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for details.
