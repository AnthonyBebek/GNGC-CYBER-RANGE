# Installing Files
FROM ubuntu

# Update apt to latest
RUN apt-get update

# Install necessary packages
RUN apt-get install -y \
    git \
    openssh-server \
    iproute2 \
    sudo \
    python3-pip \
    mariadb-server \
    iputils-ping \
    python3-dev \
    default-libmysqlclient-dev \
    pkg-config

# Set up MySQL
RUN service mariadb start && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'GNGC-PASS';" -u root && \
    mysql -e "FLUSH PRIVILEGES;" -u root -pGNGC-PASS && \
    mysql -e "CREATE DATABASE IF NOT EXISTS gngcmain;" -u root -pGNGC-PASS

# Add Admin user with the password 'admin' and put in sudoers file
RUN useradd -m admin && echo "admin:admin" | chpasswd && adduser admin sudo

# Clone repository
COPY . /root/GNGC-CYBER-RANGE

# Change directory
WORKDIR /root/GNGC-CYBER-RANGE

# Run the auto setup
RUN chmod +x autosetup.sh && bash autosetup.sh

# Expose ports if needed
EXPOSE 80
EXPOSE 443

# Start your service
CMD service mariadb start && sudo bash start.sh && bash
