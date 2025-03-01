# Use Ubuntu as the base image
FROM ubuntu:latest

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y \
    wget curl xfce4 xfce4-terminal software-properties-common

# Add Google's repository and install Chrome Remote Desktop
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb && \
    dpkg -i chrome-remote-desktop_current_amd64.deb || apt -f install -y

# Create a user for remote access
RUN useradd -m -s /bin/bash rdpuser && echo "rdpuser:password123" | chpasswd

# Start Chrome Remote Desktop on launch
CMD ["/opt/google/chrome-remote-desktop/start-host"]
