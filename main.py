import pytest
from robot import run

@pytest.fixture(scope="session")
def run_robot_tests():
    result = run("test/test.robot", outputdir="output")
    return result

def test_robot_tests(run_robot_tests):
    assert run_robot_tests == 0, "Тесты Robot Framework завершились с ошибкой"