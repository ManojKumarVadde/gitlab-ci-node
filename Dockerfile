FROM philcryer/min-jessie

# Set environment variables
ENV NVM_DIR /usr/local/nvm
ENV NVM_NODE_VERSION 6.9.1
ENV PATH $NVM_DIR/versions/node/v$NVM_NODE_VERSION/bin:$PATH
ENV CHROME_BIN /usr/bin/google-chrome
ENV DISPLAY :99

# Install built-in packages
RUN apt-get update --fix-missing
RUN apt-get install -y bash curl git libpng12-0 libelf-dev openjdk-7-jre-headless xvfb chromium libgl1-mesa-swrast
RUN apt-get clean

# Simulate Chrome
RUN ln -s /usr/bin/chromium /usr/bin/google-chrome

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash \
  && source $NVM_DIR/nvm.sh \
  && nvm install $NVM_NODE_VERSION \
  && nvm alias default $NVM_NODE_VERSION \
  && nvm use default
