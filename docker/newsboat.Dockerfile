# This Dockerfile builds the Newsboat application.
# To build the Docker image, run:
# docker build -t newsboat-arch .
#
# To run the Docker container, use:
# docker run --rm -it \
#    -v $HOME/.config/newsboat:/home/newsboat/.newsboat \
#    -v $HOME/local/bin/linkhandler:/home/newsboat/linkhandler \
#    newsboat-arch
#
# For more options, refer to the documentation.


FROM archlinux:latest

# Install Newsboat and dependencies
RUN pacman -Sy --noconfirm newsboat curl ca-certificates lynx urlscan \
    && pacman -Scc --noconfirm  # Clean package cache

# Create a non-root user for security
RUN useradd -m newsboat

# Copy linkhandler into the image
COPY linkhandler /usr/local/bin/linkhandler
RUN chmod +x /usr/local/bin/linkhandler

# Set the working directory
WORKDIR /home/newsboat

# Switch to the non-root user
USER newsboat

# Entry command
CMD ["newsboat"]
