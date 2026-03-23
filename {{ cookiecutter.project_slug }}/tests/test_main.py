from {{ cookiecutter.package_name }}.main import main


def test_main(capsys):
    main()
    captured = capsys.readouterr()
    assert "Hello from" in captured.out
