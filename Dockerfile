FROM philcryer/min-jessie

# Set environment variables
ENV NVM_DIR /usr/local/nvm
ENV NVM_NODE_VERSION 6.9.1
ENV PATH $NVM_DIR/versions/node/v$NVM_NODE_VERSION/bin:$PATH
ENV CHROME_BIN /usr/bin/google-chrome
ENV DISPLAY :99

# Install curl
RUN apt-get update --fix-missing
RUN apt-get install -y curl

# Add package repositories
RUN curl -o- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update --fix-missing

# Install packages
RUN apt-get install -y bash git libpng12-0 libelf-dev \
  openjdk-7-jre-headless xvfb google-chrome-stable libgl1-mesa-swrast
RUN apt-get clean

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash \
  && source $NVM_DIR/nvm.sh \
  && nvm install $NVM_NODE_VERSION \
  && nvm alias default $NVM_NODE_VERSION \
  && nvm use default
