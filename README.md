# pytest-ci-cd-delivery-basic

Basic pytest CI/CD project with delivery artifact generation and manual approval gate using GitHub Actions.

## Project Purpose

This project demonstrates a basic CI/CD workflow for a Python pytest automation project.

The workflow includes:

1. Running automated tests with pytest
2. Building a delivery artifact only after tests pass
3. Uploading the delivery artifact to GitHub Actions
4. Waiting for manual approval before the delivery job continues
5. Simulating an approved delivery after the manual gate is approved

This project focuses on the QA perspective of CI/CD:

- CI validates code quality automatically
- Continuous Delivery prepares a deliverable artifact after validation passes
- Manual approval controls whether the delivery artifact can move forward

## Tech Stack

- Python 3.11
- pytest
- GitHub Actions
- GitHub Environments
- Shell Script
- Git
- VS Code

## Project Structure

```text
pytest-ci-cd-delivery-basic/
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── scripts/
│   ├── build_delivery.sh
│   ├── check_env.sh
│   └── run_tests.sh
├── src/
│   └── calculator.py
├── tests/
│   └── test_calculator.py
├── .gitignore
├── pytest.ini
├── README.md
└── requirements.txt
```

## Test Scope

This project tests a simple calculator module.

Covered test scenarios:

| Test Case | Purpose |
|---|---|
| Add two positive numbers | Verify addition logic |
| Subtract two numbers | Verify subtraction logic |
| Multiply two numbers | Verify multiplication logic |
| Divide two numbers | Verify division logic |
| Divide by zero | Verify error handling |

## Local Setup

Create and activate a virtual environment:

```bash
python3.11 -m venv .venv
source .venv/bin/activate
```

Install dependencies:

```bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Check the environment:

```bash
bash scripts/check_env.sh
```

Run tests:

```bash
bash scripts/run_tests.sh
```

Build the delivery package locally:

```bash
bash scripts/build_delivery.sh
```

## Expected Local Test Result

```text
5 passed
```

## Delivery Package

After the test suite passes, the delivery script creates a compressed package:

```text
delivery/pytest-ci-cd-delivery-basic.zip
```

The package contains:

```text
src/
tests/
scripts/
README.md
pytest.ini
requirements.txt
DELIVERY_INFO.txt
```

The delivery package is generated only after pytest validation passes.

## GitHub Actions CI/CD Workflow

The GitHub Actions workflow is defined in:

```text
.github/workflows/ci-cd.yml
```

The workflow has two jobs:

| Job | Purpose |
|---|---|
| test-and-build-artifact | Runs pytest validation and builds the delivery artifact |
| manual-approved-delivery | Waits for manual approval before continuing the delivery process |

## Workflow Steps

The first job runs automatically:

1. Checkout repository
2. Set up Python 3.11
3. Install dependencies
4. Check environment
5. Run pytest validation
6. Build delivery package
7. Upload delivery artifact

The second job requires manual approval through the GitHub environment:

```text
delivery-review
```

After approval, the workflow:

1. Downloads the delivery artifact
2. Verifies that the artifact exists
3. Simulates an approved delivery step

## CI/CD Concept

In this project:

```text
CI = Run automated tests to validate quality
Continuous Delivery = Generate a delivery artifact and wait for manual approval before delivery continues
```

This project does not perform automatic production deployment.

Instead, it demonstrates a controlled delivery flow:

```text
Code Update
→ Automated Test Validation
→ Delivery Artifact Generation
→ Manual Approval Gate
→ Approved Delivery Simulation
```

## GitHub Actions Artifact

When the first job passes, GitHub Actions uploads this artifact:

```text
pytest-ci-cd-delivery-package
```

The second job downloads the same artifact after manual approval.

## Manual Approval Gate

This project uses a GitHub Environment named:

```text
delivery-review
```

The environment is configured with required reviewers.

This creates a manual approval gate before the delivery job can continue.

Expected GitHub Actions behavior:

```text
test-and-build-artifact passes
manual-approved-delivery waits for approval
reviewer approves deployment
manual-approved-delivery continues and passes
```

## QA Value

This project demonstrates that a QA automation workflow can do more than run tests.

It can also:

- Validate code automatically
- Prevent delivery when tests fail
- Generate a traceable delivery package
- Store delivery evidence in GitHub Actions
- Require manual approval before delivery continues
- Support CI/CD quality gates

## Portfolio Highlight

This project shows a basic CI/CD pipeline design for QA automation with a manual delivery approval gate:

```text
Code Update
→ Automated Test Validation
→ Delivery Artifact Generation
→ Manual Approval Gate
→ Approved Delivery Simulation
```

## Author

DianWei