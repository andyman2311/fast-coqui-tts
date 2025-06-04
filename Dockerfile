# Dockerfile to replicate ghcr.io/coqui-ai/tts
# Provides Coqui TTS with server scripts preinstalled.

FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

# Install required system packages
RUN apt-get update && apt-get install -y \
        git \
        python3-pip \
        libsndfile1 \
        && rm -rf /var/lib/apt/lists/*

# Install Coqui TTS with server extras
RUN pip install --no-cache-dir TTS[server]==0.22.0

# Expose the default server port
EXPOSE 5002

# Default command starts the TTS server
ENTRYPOINT ["python3", "-m", "TTS.server.server"]
CMD ["--list_models"]
