# This Dockerfile builds the Newsboat application.
# To build the Docker image, run:
# docker build -t newsboat-arch .
#
# To run the Docker container, use:
# docker run --rm -it -v $HOME/.config/newsboat:/home/newsboat/.newsboat newsboat-arch
#
# For more options, refer to the documentation.

FROM archlinux:latest

# Install Newsboat and dependencies
RUN pacman -Sy --noconfirm newsboat curl ca-certificates lynx urlscan python-typing_extensions \
    && pacman -Scc --noconfirm  # Clean package cache

# Create a non-root user for security
RUN useradd -m newsboat

# Download linkhandler directly from GitHub repository
RUN curl -L https://github.com/LukeSmithxyz/voidrice/raw/4a3ad91070328668cd3c8c375e38843f21506e7a/.local/bin/linkhandler \
    -o /usr/local/bin/linkhandler \
    && chmod +x /usr/local/bin/linkhandler

# Download OpenSSL package directly from Arch Linux archive
RUN curl -L https://archive.archlinux.org/packages/o/openssl/openssl-3.4.0-1-x86_64.pkg.tar.zst \
    -o /home/newsboat/openssl-3.4.0-1-x86_64.pkg.tar.zst

# Install the downloaded OpenSSL package
RUN pacman -U --noconfirm /home/newsboat/openssl-3.4.0-1-x86_64.pkg.tar.zst

# Clean up the downloaded package file
RUN rm /home/newsboat/openssl-3.4.0-1-x86_64.pkg.tar.zst

# Set the working directory
WORKDIR /home/newsboat

# Switch to the non-root user
USER newsboat

# Entry command
CMD ["newsboat"]
