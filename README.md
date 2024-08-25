# Conditional Probability Modelling for Publishing Decision

## Overview

This project provides a set of functions to assist a publisher in making informed decisions about whether to publish a book. The model assumes that the outcome of publishing a book can either be a success, with a specified profit, or a failure, with a specified loss. The publisher has the option to consult multiple reviewers, each providing a positive or negative opinion. These reviewers are assumed to be conditionally independent in their opinions given the outcome (success or failure).

## Function Descriptions

### 1. `ProbSuccess(ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg)`
- **Purpose:** Calculates the conditional probability of success based on given probabilities and the number of positive and negative reviews.
- **Parameters:**
  - `ProbSuc`: Probability of the book being a success.
  - `ProbPosSuc`: Probability of receiving a positive review if the book is successful.
  - `ProbPosFail`: Probability of receiving a positive review if the book fails.
  - `NPos`: Number of positive reviews received.
  - `NNeg`: Number of negative reviews received.
- **Returns:** The conditional probability of success.

### 2. `PubValue1(ValueSuc, ValueFail, Fee, ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg)`
- **Purpose:** Determines whether the publisher should publish the book and calculates the expected return if they do.
- **Parameters:**
  - `ValueSuc`: Profit if the book succeeds.
  - `ValueFail`: Loss if the book fails (input as a positive number).
  - `Fee`: Cost of consulting a reviewer.
  - `ProbSuc`, `ProbPosSuc`, `ProbPosFail`, `NPos`, `NNeg`: As described above.
- **Returns:** A Boolean indicating whether to publish and the expected return based on the decision.

### 3. `PubValue2(ValueSuc, ValueFail, Fee, ProbSuc, ProbPosSuc, ProbPosFail, N)`
- **Purpose:** Computes the expected return when the publisher consults with `N` reviewers.
- **Parameters:**
  - `ValueSuc`: Profit if the book succeeds.
  - `ValueFail`: Loss if the book fails (input as a positive number).
  - `Fee`: Cost of consulting a reviewer.
  - `ProbSuc`, `ProbPosSuc`, `ProbPosFail`: As described above.
  - `N`: Number of reviewers to consult.
- **Returns:** The expected return for consulting `N` reviewers.

### 4. `OptimalN(ValueSuc, ValueFail, Fee, ProbSuc, ProbPosSuc, ProbPosFail)`
- **Purpose:** Finds the optimal number of reviewers to consult to maximize expected profit.
- **Parameters:**
  - `ValueSuc`: Profit if the book succeeds.
  - `ValueFail`: Loss if the book fails (input as a positive number).
  - `Fee`: Cost of consulting a reviewer.
  - `ProbSuc`, `ProbPosSuc`, `ProbPosFail`: As described above.
- **Returns:** A pair consisting of the optimal number of reviewers to consult and the corresponding expected profit.

## Usage

To use these functions, define the required parameters based on the specific scenario and call the relevant functions to make informed publishing decisions. These functions provide a practical framework for optimizing the decision-making process in the context of book publishing.
