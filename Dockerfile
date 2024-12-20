# Use Node.js LTS (Long Term Support) as the base image
FROM node:22.12.0-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Copy application source code
COPY . .

# Create a non-root user for security
RUN addgroup -S nodeapp && \
    adduser -S nodeapp -G nodeapp && \
    chown -R nodeapp:nodeapp /app

# Switch to non-root user
USER nodeapp

# Expose the port your app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
