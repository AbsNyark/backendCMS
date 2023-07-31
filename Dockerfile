# Use the official Node.js 14.x image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and yarn.lock files to the container
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm install --production

# Copy the entire project directory to the container
COPY . .

# Set the environment variables required by Strapi
ENV NODE_ENV production
ENV DATABASE_CLIENT=postgres
ENV DATABASE_URL=postgresql://postgres:xqPSxqCDqxMJ2Naat1fk@containers-us-west-138.railway.app:5943/railway
                   

ENV DATABASE_HOST=containers-us-west-138.railway.app
ENV DATABASE_PORT=5943
ENV DATABASE_NAME=railway
ENV DATABASE_USERNAME=postgres
ENV DATABASE_PASSWORD=xqPSxqCDqxMJ2Naat1fk

ENV APP_KEYS=k55ZTnh8zpp+RgfKGFH+ow==,emWScOj6oRLuo9GpElohpQ==,NcAhXOO3tLj/U6c8cc22qw==,JfLEaKTSdyJZsrLu2pQKhg==
ENV API_TOKEN_SALT=tKsFy7bb9BVQh4DD9MKROw==
ENV ADMIN_JWT_SECRET=8zcsu6zsd3f6B0Y1euqzTA==
ENV TRANSFER_TOKEN_SALT=u6+oGpVtPXMdxmyKuaxKuw==
ENV JWT_SECRET=en+t18xlQnNT8dOmzl9x4g==

# Set the Cloudinary configuration environment variables
ENV CLOUDINARY_NAME=dvpbxzktm
ENV CLOUDINARY_API_KEY=581658434511332
ENV CLOUDINARY_API_SECRET=nImdsZ-N_k6OhuYdd_lIPwRv1eI
# Expose the port specified in the Strapi configuration

RUN ["npm", "run", "build"]

EXPOSE 1337
# Start the Strapi server
CMD ["npm", "run", "start"]