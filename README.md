# README

This Dockerfile creates a Docker image equipped with NVIDIA CUDA, Python, pip, PyTorch, and Jupyter Lab, designed to support CUDA-accelerated computing within Jupyter Lab notebooks.

## Environment Variables

Setting environment variables for Jupyter Lab access is optional. If you prefer to secure your Jupyter Lab instance, you can set the following environment variables:

- `JUPYTER_TOKEN`: The token used for Jupyter Lab authentication.
- `JUPYTER_PASSWORD`: The password used for Jupyter Lab authentication.

If you do not set these variables, Jupyter Lab will be accessible without authentication.

## Volume

The container is configured with a volume mounted to `/app`, serving as the working directory. This setup allows for persistent storage and easy access to notebooks and other files between the host and the container.

## Docker Commands

### Building the Docker Image

To build the Docker image, use the following command:

```bash
docker build -t my_cuda_jupyter_image .
```

### Running the Docker Container

To run the Docker container with the necessary port mappings, volume mount, and optional environment variables for Jupyter Lab access, use:

```bash
docker run --gpus all -it -p 8888:8888 \
  -v /path/to/your/app:/app \
  [-e JUPYTER_TOKEN=your_token] \
  [-e JUPYTER_PASSWORD=your_password] \
  my_cuda_jupyter_image
```

Replace `/path/to/your/app` with the actual path to your application directory on your host. The `JUPYTER_TOKEN` and `JUPYTER_PASSWORD` environment variables are optional; include them only if you wish to set a token and password for Jupyter Lab access.

## Using Docker Compose

For convenience, you can also use Docker Compose to manage the container. Below is a sample `docker-compose.yml` file configuration:

```yaml
version: '3.8'
services:
  jupyterlab:
    build: .
    ports:
      - "8888:8888"
    volumes:
      - "/path/to/your/app:/app"
    environment:
      - JUPYTER_TOKEN=your_optional_token
      - JUPYTER_PASSWORD=your_optional_password
      - NVIDIA_VISIBLE_DEVICES=all
```

In the `docker-compose.yml` file, setting `JUPYTER_TOKEN` and `JUPYTER_PASSWORD` is optional. Remove or comment out these lines if you prefer not to use a token or password for Jupyter Lab access. Replace `/path/to/your/app` with your actual application path.

To start the container using Docker Compose, run:

```bash
docker-compose up
```
