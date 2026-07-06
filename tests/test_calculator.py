import pytest

from src.calculator import add, divide, multiply, subtract


def test_add_two_positive_numbers():
    assert add(3, 2) == 5


def test_subtract_two_numbers():
    assert subtract(3, 2) == 1


def test_multiply_two_numbers():
    assert multiply(3, 2) == 6


def test_divide_two_numbers():
    assert divide(6, 2) == 3


def test_divide_by_zero_should_raise_error():
    with pytest.raises(ValueError, match="Cannot divide by zero."):
        divide(6, 0)