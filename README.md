# Subdomain Test

A SvelteKit application powered by Bun and deployable via Railpack.

## Prerequisites

- [Bun](https://bun.sh/) (>=1.3.0)

## Development

Install dependencies and start the development server:

```sh
bun install
bun run dev

# or start the server and open the app in a new browser tab
bun run dev -- --open
```

## Building

To create a production version of your app:

```sh
bun run build
```

You can preview the production build with `bun run preview`.

## Deployment

This project is configured for deployment via Railpack:

1. **Railpack Configuration**: See `railpack.json` for deployment settings
2. **Docker Support**: Use `Dockerfile.railpack` for containerized deployment
3. **Bun Runtime**: Optimized for Bun's fast JavaScript runtime

### Deploy with Railpack

The project includes:
- `railpack.json` - Railpack deployment configuration
- `Dockerfile.railpack` - Optimized Dockerfile for Bun
- `.railpackignore` - Files to exclude from deployment

### Deploy with Docker

```sh
# Build the Docker image
docker build -f Dockerfile.railpack -t subdomain-test .

# Run the container
docker run -p 3000:3000 subdomain-test
```

## Scripts

- `bun run dev` - Start development server
- `bun run build` - Build for production
- `bun run preview` - Preview production build
- `bun run start` - Start production server
- `bun run check` - Run type checking
- `bun run format` - Format code with Prettier
- `bun run lint` - Lint code with Prettier
