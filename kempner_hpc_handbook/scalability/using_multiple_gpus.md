# Using Multiple GPUs

[Techniques for leveraging multiple GPUs to enhance computational capabilities.]

## Machine Learning Parallelism Approaches on GPUs
The scaling of machine learning (ML) workloads in HPC environments can be achieved through various parallelism approaches. This section outlines the primary methods for parallelizing ML computations.

### Data Parallelism
Involves splitting the dataset into smaller batches that are processed in parallel across different GPUs. Each GPU trains a copy of the model on its subset of the data, and the results are aggregated to update the model.


```{figure} figures/png/data_parallel.PNG
---
height: 450 px
name: Data Parallelism Diagram
---
(*Credit: [nvidia.com](https://nvidia.com)*)
```

### Model Parallelism
The model's parameters are divided across multiple GPUs. This approach is useful for training large models that cannot fit into the memory of a single GPU. GPUs work on different parts of the model simultaneously.


```{figure} figures/png/tensor_parallel_1.PNG
---
height: 300px
name: Model Parallelism Diagram 1
---
Model Parallelism Diagram (*Credit: [nvidia.com](https://nvidia.com)*)
```

```{figure} figures/png/tensor_parallel_2.PNG
---
height: 350px
name: Model Parallelism Diagram 2
---
Model Parallelism Diagram (*Credit: [nvidia.com](https://nvidia.com)*)
```

```{figure} figures/png/tensor_parallel_3.PNG
---
height: 350px
name: Model Parallelism Diagram 3
---
Model Parallelism Diagram (*Credit: [nvidia.com](https://nvidia.com)*)
```

### Pipeline Parallelism
Combines aspects of data and model parallelism by splitting the model into stages that are processed in a pipeline fashion. Each stage of the model is processed on different GPU, allowing for efficient parallel processing of large models and datasets.

```{figure} figures/png/pipeline_parallel.PNG
---
height: 350px
name: Pipeline Parallelism Diagram
---
Pipeline Parallelism Diagram (*Credit: [nvidia.com](https://nvidia.com)*)
```

### Hybrid Parallelism
The hybrid model is a combination of data, model, and pipeline parallelism. It combines these techniques to benefit from the scalability of data parallelism, the memory efficiency of model parallelism, and the throughput efficiency of pipeline parallelism. For instance, a large model can be divided into segments (model parallelism), each segment can be replicated across multiple devices (data parallelism), and different segments can process different batches of data simultaneously (pipeline parallelism).

```{figure} figures/png/hybrid_parallel_1.PNG
---
height: 350px
name: Hybrid Parallelism Diagram 1
---
Hybrid Parallelism Diagram (*Credit: [nvidia.com](https://nvidia.com)*)
```

```{figure} figures/png/hybrid_parallel_2.PNG
---
height: 350px
name: Hybrid Parallelism Diagram 2
---
Hybrid Parallelism Diagram (*Credit: [nvidia.com](https://nvidia.com)*)
```

These parallelism approaches leverage the computational power of HPC to tackle the complexities of training and deploying large-scale ML models, ensuring efficient use of resources and reducing computation time.

### Comparison Table

The following table highlights the core aspects and trade-offs of using data, model, pipeline, and hybrid parallelism approaches with GPUs for machine learning tasks.


| Approach          | Features                                         | Pros                                                   | Cons                                            |
|-------------------|--------------------------------------------------|--------------------------------------------------------|-------------------------------------------------|
| **Data Parallelism**  | Splits dataset, processes chunks on different GPUs. | - Scalable<br>- Easy to implement                      | - High communication overhead                   |
| **Model Parallelism** | Different parts of the model on multiple GPUs.     | - Trains large models<br>- Utilizes GPU specialization | - Complex dependencies<br>- Resource underutilization |
| **Pipeline Parallelism** | Model stages across GPUs, data processed in sequence. | - Efficient resource use<br>- Lowers idle times        | - Scheduling complexity<br>- Data flow management       |
| **Hybrid Parallelism**  | Combines all three methods for optimization.       | - Minimizes overhead<br>- Maximizes efficiency         | - High complexity<br>- Advanced infrastructure required |
