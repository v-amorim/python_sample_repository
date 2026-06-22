from python_sample_repository.main import main


def test_main_runs(capsys):
    main()
    assert capsys.readouterr().out.strip() == "Hello World"
