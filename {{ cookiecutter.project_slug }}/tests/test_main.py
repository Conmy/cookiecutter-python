from {{ cookiecutter.package_name }}.main import main
from typing import Any


def test_main(capsys: Any) -> None:
    main()
    captured = capsys.readouterr()
    assert "Hello from" in captured.out
