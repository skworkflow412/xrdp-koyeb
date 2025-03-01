FROM ubuntu:latest  
ENV DEBIAN_FRONTEND=noninteractive  

# Install necessary dependencies  
RUN apt update && apt install -y wget wine  

# Download and install LiteManager Server  
RUN wget https://litemanager.com/soft/LinuxServer/LiteManager_Ubuntu_x64.tar.gz && \  
    tar -xzf LiteManager_Ubuntu_x64.tar.gz && \  
    chmod +x litemanager && ./litemanager --install  

# Expose LiteManager's default port  
EXPOSE 5650  

# Run LiteManager on startup  
CMD ["./litemanager", "--start"]
