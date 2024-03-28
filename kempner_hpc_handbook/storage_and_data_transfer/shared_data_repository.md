# Shared Data/Model Repository

We host several popular ML datasets and models on the Kempner HPC cluster. This approach reduces the need for multiple transfers of the same data/model by researchers and provides a central, read-only repository for all Kempner Institute users to access for their ML workflows. Only the admin team has write access, but users can submit requests for popular data/models. After a careful review, we may place a copy in the shared data/model repository. The current path on the cluster is:

```bash
/n/kempner_shared/Everyone
```

```{note}
We will develop a web interface later for data and model discovery.
```


The current list of ML models, 

| Organization | Model Name             |
|--------------|------------------------|
| CodeLlama    | CodeLlama-7b-hf        |
| EleutherAI   | pythia-160m-deduped    |
| EleutherAI   | pythia-70m-deduped     |
| OpenAI       | gpt2                   |
| Google       | t5-base                |

The current list of ML datasets,

| Dataset Name               | Description |
|----------------------------|-------------|
| c4_original                | The original version of the "Colossal Clean Crawled Corpus" (C4) dataset, designed for training natural language processing models. |
| dolma                      | Dolma is a dataset of 3 trillion tokens from a diverse mix of web content, academic publications, code, books, and encyclopedic materials. |
| imagenet_winter21_whole | An updated version of the ImageNet dataset, containing a wide variety of annotated images for visual object recognition, collected during the winter of 2021. |
