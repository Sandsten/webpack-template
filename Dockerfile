FROM node:14-alpine

# Create a folder called app in our container and set it as our working directory
# I.e all subsequent commands will use this as root
WORKDIR /app

### Copy over package.json and install packages before copying over source code.
### Since each copy adds a new layer and if any content inside the copy has changed that layer and all subsequent ones have to be rebuiltz§

# Copy over our package files in to the root folder of our project in the container
COPY ["package.json", "package-lock.json", "./"]

# Install npm packages
RUN npm install

# Copy our source code into the container
COPY . .

CMD [ "npm", "start" ]