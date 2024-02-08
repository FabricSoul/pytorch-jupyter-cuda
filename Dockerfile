# Use an official NVIDIA CUDA image as a parent image
FROM nvidia/cuda:12.3.1-runtime-ubuntu22.04

# Set a working directory
WORKDIR /app

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --upgrade pip

# Install PyTorch with CUDA support
RUN pip3 install torch torchvision torchaudio

# Install Jupyter Lab
RUN pip3 install jupyterlab

# Expose the port Jupyter Lab runs on
EXPOSE 8888

# Start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=${JUPYTER_TOKEN}", "--NotebookApp.password=${JUPYTER_PASSWORD}"]
