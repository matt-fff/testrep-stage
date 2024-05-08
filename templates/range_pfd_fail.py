import pytest


@pytest.mark.parametrize("num_a,num_b", [(val, val + 1) for val in range(100)])
def test_origin_matches(num_a: int, num_b: int):
    assert num_a == num_b
