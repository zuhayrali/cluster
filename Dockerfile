# Base image
FROM intelanalytics/ipex-llm-inference-cpp-xpu:latest

# Set environment variables
ENV ZES_ENABLE_SYSMAN=1
ENV OLLAMA_HOST=0.0.0.0:11434
ENV DISPLAY=${DISPLAY}

# Install dependencies if needed (add commands here, if applicable)

# Create necessary directories and initialize Ollama
RUN mkdir -p /llm/ollama && \
    cd /llm/ollama && \
    init-ollama

# Set the working directory
WORKDIR /llm/ollama

# Expose GPU devices and X11 socket
VOLUME ["/tmp/.X11-unix", "/root/.ollama"]

# Entry point
ENTRYPOINT ["./ollama", "serve"]
