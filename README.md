# README

This Dockerfile creates a Docker image equipped with NVIDIA CUDA, Python, pip, PyTorch, and Jupyter Lab, designed to support CUDA-accelerated computing within Jupyter Lab notebooks.

## Environment Variables

When running the Docker container, you must set two environment variables for Jupyter Lab access:

- `JUPYTER_TOKEN`: The token used for Jupyter Lab authentication.
- `JUPYTER_PASSWORD`: The password used for Jupyter Lab authentication.

## Volume

The container is configured with a volume mounted to `/app`, serving as the working directory. This setup allows for persistent storage and easy access to notebooks and other files between the host and the container.

## Docker Commands

### Building the Docker Image

To build the Docker image, use the following command:

```bash
docker build -t my_cuda_jupyter_image .
```

### Running the Docker Container

To run the Docker container with the necessary port mappings, volume mount, and environment variables, use:

```bash
docker run -it -p 8888:8888 \
  -v /path/to/your/app:/app \
  -e JUPYTER_TOKEN=your_token \
  -e JUPYTER_PASSWORD=your_password \
  my_cuda_jupyter_image
```

Ensure you replace `/path/to/your/app`, `your_token`, and `your_password` with the actual path to your application directory on your host, and your desired Jupyter token and password, respectively.

## Using Docker Compose

For convenience, you can also use Docker Compose to manage the container. Below is a sample `docker-compose.yml` file configuration:

```yaml
version: '3'
services:
  jupyter:
    build: .
    ports:
      - "8888:8888"
    volumes:
      - /path/to/your/app:/app
    environment:
      - JUPYTER_TOKEN=your_token
      - JUPYTER_PASSWORD=your_password
```

Replace `/path/to/your/app`, `your_token`, and `your_password` in the `docker-compose.yml` file with your actual application path, Jupyter token, and Jupyter password, respectively.

To start the container using Docker Compose, run:

```bash
docker-compose up
```

