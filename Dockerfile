# -----------------
# Build stage
# -----------------
FROM node:24-alpine AS build

WORKDIR /app

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy lockfile + package manifests first for better caching
COPY pnpm-lock.yaml package.json ./

# Install deps (frozen lockfile)
RUN pnpm install --frozen-lockfile

# Copy rest of the project
COPY . .

# Build the SvelteKit app with adapter-node
RUN pnpm run build

# -----------------
# Runtime stage
# -----------------
FROM node:24-alpine AS runtime
WORKDIR /app

# Copy only production artifacts
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/pnpm-lock.yaml ./pnpm-lock.yaml
COPY --from=build /app/build ./build

# Install only production dependencies (if any)
RUN pnpm install --prod --frozen-lockfile || true

ENV NODE_ENV=production
EXPOSE 3000

CMD ["node", "./build/index.js"]


