.PHONY: setup lint test data preprocess train baselines eval figures tables paper edge reproduce clean help

# Enforce MPS fallback across all targets
export PYTORCH_ENABLE_MPS_FALLBACK=1
export KMP_DUPLICATE_LIB_OK=TRUE

PYTHON ?= python
PIP ?= pip

help:
	@echo "PreVisS-Net Makefile"
	@echo "Available targets:"
	@echo "  setup        - Install package in editable mode with dev dependencies"
	@echo "  lint         - Run ruff and black formatting checks"
	@echo "  test         - Run pytest test suite"
	@echo "  data         - Download and verify raw datasets"
	@echo "  preprocess   - Run radiometric, orthomosaic, index computation pipelines"
	@echo "  train        - Run PreVisS-Net training on D1 with 5-fold CV"
	@echo "  baselines    - Train and evaluate baseline models (B1, B2, B3)"
	@echo "  eval         - Evaluate on same-domain test and zero-shot sets (D3-D6)"
	@echo "  figures      - Generate publication figures"
	@echo "  tables       - Generate metric and significance tables"
	@echo "  paper        - Compile paper artifacts and summaries"
	@echo "  edge         - Export CoreML and ONNX models and run latency benchmarks"
	@echo "  reproduce    - Run end-to-end pipeline from data to evaluation"
	@echo "  clean        - Clean build, cache, and temporary artifacts"

setup:
	@echo "Setting up PreVisS-Net package..."
	$(PIP) install -e .

lint:
	@echo "Running ruff check..."
	ruff check src tests scripts
	@echo "Running black check..."
	black --check src tests scripts

format:
	ruff check --fix src tests scripts
	black src tests scripts

test:
	@echo "Running pytest..."
	$(PYTHON) -m pytest

data:
	@echo "Downloading and verifying datasets..."
	$(PYTHON) -m previssnet.data.download

preprocess:
	@echo "Preprocessing datasets (indices, alignment, temporal)..."
	$(PYTHON) -m previssnet.preprocess.schema

train:
	@echo "Training PreVisS-Net on D1..."
	$(PYTHON) -m previssnet.train.trainer

baselines:
	@echo "Running baselines (B1, B2, B3)..."
	$(PYTHON) -m previssnet.baselines.base

eval:
	@echo "Evaluating same-domain and zero-shot performance..."
	$(PYTHON) -m previssnet.eval.harness

figures:
	@echo "Generating figures..."
	$(PYTHON) -m scripts.figures.generate_figures 2>/dev/null || true

tables:
	@echo "Generating tables..."
	$(PYTHON) -m scripts.tables.generate_tables 2>/dev/null || true

paper: figures tables
	@echo "Compiling paper outputs..."

edge:
	@echo "Exporting CoreML and ONNX benchmarks..."
	$(PYTHON) -m previssnet.deploy.benchmark

reproduce: data preprocess train baselines eval figures tables edge
	@echo "Full reproduction pipeline completed."

clean:
	@echo "Cleaning temporary files and build artifacts..."
	rm -rf build/ dist/ *.egg-info .pytest_cache .ruff_cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
