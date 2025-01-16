# Use a lightweight, current Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /home/app

# Copy only package files for efficient caching of dependencies
COPY ./app/package*.json ./
RUN npm ci --only=production

# Copy the application code
COPY ./app .

# Use environment variables from a .env file (set at runtime)
ENV NODE_ENV=production

# Expose the application port (optional, for documentation purposes)
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
