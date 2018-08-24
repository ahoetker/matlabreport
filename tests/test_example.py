import pytest

def concat(string_1, string_2):
    return string_1 + string_2


def test_concat():
    assert concat("foo", "bar") == "foobar"
