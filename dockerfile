# Installing Files
FROM ubuntu
RUN apt update 
RUN apt install -y \
    git \
    openssh-server \
    iproute2

# Clone repository
RUN git clone https://github.com/AnthonyBebek/GNGC-CYBER-RANGE /root/GNGC-CYBER-RANGE

# Change directory
WORKDIR /root/GNGC-CYBER-RANGE

# Display content of the directory
RUN ls

# Expose ports if needed
# EXPOSE 80
# EXPOSE 8080
