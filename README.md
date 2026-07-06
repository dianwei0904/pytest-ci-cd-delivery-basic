# pytest-ci-cd-delivery-basic

Basic pytest project demonstrating CI test validation and CD-style delivery artifact generation with GitHub Actions.

## Project Purpose

This project demonstrates a basic CI/CD workflow for a Python pytest automation project.

The workflow includes:

1. Running automated tests with pytest
2. Validating the project before delivery
3. Building a delivery package only after tests pass
4. Uploading the delivery package as a GitHub Actions artifact

This project focuses on the QA perspective of CI/CD:

- CI checks whether the code is still valid
- CD produces a deliverable package after validation passes

## Tech Stack

- Python 3.11
- pytest
- GitHub Actions
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

Build the delivery package:

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

Workflow steps:

1. Checkout repository
2. Set up Python 3.11
3. Install dependencies
4. Check environment
5. Run pytest tests
6. Build delivery package
7. Upload delivery artifact

## CI/CD Concept

In this project:

```text
CI = Run automated tests to validate quality
CD = Generate a delivery artifact after validation passes
```

This means the delivery package is not created manually.  
It is generated automatically by the workflow after the test suite passes.

## GitHub Actions Artifact

When the GitHub Actions workflow passes, the delivery package can be downloaded from the workflow run artifact:

```text
pytest-ci-cd-delivery-package
```

## QA Value

This project demonstrates that a QA automation workflow can do more than run tests.

It can also:

- Validate code automatically
- Prevent delivery when tests fail
- Generate a traceable delivery package
- Keep delivery evidence in GitHub Actions
- Support CI/CD quality gates

## Portfolio Highlight

This project shows basic CI/CD pipeline design for QA automation:

```text
Code Update
→ Automated Test Validation
→ Delivery Package Generation
→ GitHub Actions Artifact Upload
```

## Author

DianWei