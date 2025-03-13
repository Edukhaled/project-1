# Use the official Node.js image.
FROM node:20

# Set the working directory.
WORKDIR /app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of your application code.
COPY . .

# Build the React application with increased memory allocation for Node.js
RUN NODE_OPTIONS="--max-old-space-size=1024" npm run build

# Install Vite globally.
RUN npm install -g vite

# Serve the application using Vite's preview command.
CMD ["vite", "preview", "--host", "--port", "5000"]

# Expose port 5000 for the React app.
EXPOSE 5000