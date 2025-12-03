#!/bin/bash

# Esperando o PostgreSQL estar pronto
while ! nc -z  postgres 5432; do
    sleep 0.5
done
echo "PostgresSQL esta pronto!"

# Executa as migrações
echo "Executando migrações do Alembic"
alembic upgrade head

# Incia a aplicação
echo "Iniciando aplicação FastAPI"
exec uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
