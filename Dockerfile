# Use Ubuntu base image
FROM ubuntu:latest

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install Chrome Remote Desktop, Xfce desktop environment, and dependencies
RUN apt update && apt install -y \
    wget curl xfce4 xfce4-terminal chrome-remote-desktop

# Create a user for remote access
RUN useradd -m -s /bin/bash rdpuser && echo "rdpuser:password123" | chpasswd

# Start Chrome Remote Desktop on launch
CMD ["chrome-remote-desktop", "--start"]
