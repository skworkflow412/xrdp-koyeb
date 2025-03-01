# Use the latest Ubuntu image
FROM ubuntu:latest

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt update && apt install -y \
    xrdp \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    x11-xserver-utils \
    && apt clean

# Create a user for RDP
RUN useradd -m -s /bin/bash rdpuser && echo "rdpuser:password123" | chpasswd

# Configure xRDP
RUN echo "xfce4-session" > /home/rdpuser/.xsession && \
    chown rdpuser:rdpuser /home/rdpuser/.xsession

# Start xRDP on container startup
CMD /etc/init.d/xrdp start && tail -F /var/log/xrdp.log
