import pytest
from config import Settings
from pydantic import ValidationError


def test_valid_settings():
    s = Settings()
    assert s.model.startswith("gemma")
    assert 0.0 <= s.temperature <= 1.0
    assert s.max_tokens > 0

def test_invalid_temperature():
    with pytest.raises(ValidationError):
        Settings(temperature=2.0)

def test_invalid_max_tokens():
    with pytest.raises(ValidationError):
        Settings(max_tokens=0)
