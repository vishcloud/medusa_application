FROM node:20

WORKDIR /app

# Install Medusa CLI
RUN npm install -g @medusajs/medusa-cli

# Copy package.json and install dependencies
COPY package.json .
COPY yarn.lock .
RUN yarn install

# Copy application code
COPY . .

# Set environment variables
ENV NODE_ENV=production
ENV PORT=9000
ENV DATABASE_URL=postgres://vishal:vishal@localhost:5432/db_vishal
ENV REDIS_URL=redis://redis:6379

# Build the application
# RUN yarn build

# Expose the application port
EXPOSE 9000

# Start the application
CMD ["medusa", "start"]
