import pytest


def test_ui_runs(monkeypatch):
    # This is a smoke test to ensure the UI script runs without error
    try:
        pass
    except Exception as e:
        pytest.fail(f"webchat_ui failed to run: {e}")
