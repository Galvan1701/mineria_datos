#!/bin/bash

# Fast startup verification script
# Runs on every codespace start

# Quick check: does .venv exist and is it valid?
if [ ! -f .venv/bin/python ]; then
    echo "⚠️  Virtual environment missing, recreating..."
    uv sync --locked
fi

# Quick check: is Jupyter kernel registered?
if ! uv run jupyter kernelspec list | grep -q "mineria-datos"; then
    echo "⚠️  Jupyter kernel not found, registering..."
    uv run python -m ipykernel install --user --name mineria-datos --display-name "Python 3.13 (mineria-datos)"
fi

echo "✓ Environment ready!"
