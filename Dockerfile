# -----------------
# Build stage
# -----------------
FROM oven/bun:1.3.0-alpine AS build

WORKDIR /app

# Copy lockfile + package manifests first for better caching
COPY bun.lockb package.json ./

# Install deps (frozen lockfile)
RUN bun install --frozen-lockfile

# Copy rest of the project
COPY . .

# Build the SvelteKit app with adapter-node
RUN bun run build

# -----------------
# Runtime stage
# -----------------
FROM oven/bun:1.3.0-alpine AS runtime
WORKDIR /app

# Copy only production artifacts
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/bun.lockb ./bun.lockb
COPY --from=build /app/build ./build

# Install only production dependencies (if any)
RUN bun install --production --frozen-lockfile || true

ENV NODE_ENV=production
EXPOSE 3000

CMD ["bun", "run", "start"]


