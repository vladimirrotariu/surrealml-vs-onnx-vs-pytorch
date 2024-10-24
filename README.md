# SurrealML versus PyTorch versus ONNX

SurrealML simplifies storing, loading, and executing trained ML models, working alongside existing frameworks like PyTorch, TensorFlow, scikit-learn, and linfa, while supporting execution in both Python and Rust.

In this repo, you can find [the source code](https://github.com/vladimirrotariu/surrealml-vs-onnx-vs-pytorch/blob/main/surrealml_vs_onnx_vs_pytorch/comparing_surreal_ml_onnx_pytorch.ipynb) behind the following comparison, which shows execution times for `SurrealML`, as contrasted with `PyTorch` and `ONNX`.
![alt text](surrealml_vs_onnx_vs_pytorch/plots/execution_time_vs_test_size.png)

To start, clone this repository, and then execute:
```bash
poetry install
```
and then follow the Jupyter notebook attached.

In case you want to just read the notebook, you may find it in [HTML format](https://github.com/vladimirrotariu/surrealml-vs-onnx-vs-pytorch/blob/main/surrealml_vs_onnx_vs_pytorch/comparing_surreal_ml_onnx_pytorch.html) as well, to be opened in a browser of convenience.

## System specs
We used the following setup to create the benchmark:
```text
Number of physical CPU cores: 10
Number of logical CPU cores: 20
Total Memory (RAM): 15.47 GB
Operating System: Linux 5.15.153.1-microsoft-standard-WSL2
Processor: x86_64
Python Version: 3.11.10
```
as well as `SurrealDB 1.5.5`.
