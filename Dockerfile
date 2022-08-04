FROM ubuntu:22.04
USER 0
WORKDIR /app
RUN apt-get update && apt-get install -y libguestfs-tools qemu-utils linux-image-generic && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY . .
ENTRYPOINT ["/app/kvm-mergeide.sh"]
