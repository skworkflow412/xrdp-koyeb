FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y \
    xrdp \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    x11-xserver-utils \
    && apt clean

# Set default user and password
RUN useradd -m -s /bin/bash rdpuser && echo "rdpuser:password123" | chpasswd

# Configure xRDP
RUN echo "xfce4-session" > /home/rdpuser/.xsession && \
    chown rdpuser:rdpuser /home/rdpuser/.xsession

# Enable xRDP service
RUN systemctl enable xrdp

# Expose RDP port
EXPOSE 3389

# Start xRDP service
CMD ["/usr/sbin/xrdp", "-n"
