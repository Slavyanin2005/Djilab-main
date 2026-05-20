@echo off
chcp 65001 >nul 
echo Запуск тестов...
docker-compose exec backend pytest tests/ -v --cov=catalog --cov-report=html

echo Копирование отчёта...
docker cp djilab-backend:/app/htmlcov ./htmlcov

echo Открытие отчёта...
start htmlcov\index.html

echo Готово!
pause