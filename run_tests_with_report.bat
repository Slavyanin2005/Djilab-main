@echo off
chcp 65001 >nul

echo === Запуск всех тестов ===
docker-compose exec backend pytest tests/ -v --cov=catalog --cov-report=html

echo === Запуск тестов кэша ===
docker-compose exec backend pytest -m cache -v

echo === Копирование отчёта ===
docker cp djilab-backend:/app/htmlcov ./htmlcov

echo === Открытие отчёта ===
start htmlcov\index.html

echo Готово!
pause