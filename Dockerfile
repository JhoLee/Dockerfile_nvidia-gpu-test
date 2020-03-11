
FROM nvidia/cuda:10.0-base-ubuntu16.04
FROM tensorflow/tensorflow:1.14.0-gpu-py3
# nvidia-docker 1.0
LABEL com.nvidia.volumes.needed="nvidia-driver"
LABEL com.nvidia.cuda.version="${CUDA_VERSION}"
  
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
     echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
 
ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all
ENV NVIDIA_REQUIRE_CUDA "cuda>=9.0"
ENV CUDA_VISIBLE_DEVICES=0

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    nvidia-cuda-toolkit
