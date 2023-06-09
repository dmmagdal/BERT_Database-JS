# Docker file to run a container that will run index.ts.

# Load NodeJS image for node 18.12.1.
FROM node:18.12.1-slim

# Set locale for variable (pulled from dockerfile in original OpenAI
# GPT2 repository).
ENV LANG=C.UTF-8

# Create a directory in the docker container. Set the working directory
# in the container to that newly created directory and then add all
# files from the current directory in the host to the working directory
# in the container.
RUN mkdir /bert-test
WORKDIR /bert-test
ADD . /bert-test

# Set up a volume so that the current directory in the host is
# connected to the working directory in the container.

# Install all required modules in the requirements.txt file.
RUN npm install
RUN npm run build

# Run index.ts.
CMD ["node", "dist/index.js"]