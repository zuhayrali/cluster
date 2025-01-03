FROM docker.io/intelanalytics/ipex-llm-inference-cpp-xpu:latest

ENV ZES_ENABLE_SYSMAN=1
ENV OLLAMA_HOST=0.0.0.0:11434
# ENV OLLAMA_INTEL_GPU=true
ENV OLLAMA_KEEP_ALIVE=3600
ENV DEVICE=Arc

RUN mkdir -p /llm/ollama; \
    cd /llm/ollama; \
    init-ollama;

ENV LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"

WORKDIR /llm/ollama

ENTRYPOINT ["./ollama", "serve"]
