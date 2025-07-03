# BrandFontsIQ Rails - Docker Development Setup

## Prerequisites

- Docker Desktop installed and running
- GitHub CLI (`gh`) configured
- Supabase password (get from Supabase dashboard)

## Initial Setup

1. **Copy environment variables:**
   ```bash
   cp .env.example .env
   ```
   Edit `.env` and add your Supabase password.

2. **Build and setup the development environment:**
   ```bash
   bin/docker-dev setup
   ```
   This will:
   - Build Docker images
   - Install gems
   - Create databases
   - Run migrations
   - Install Tailwind CSS

3. **Start the application:**
   ```bash
   bin/docker-dev up
   ```

## Accessing the Application

- Rails app: http://localhost:3000
- Sidekiq web UI: http://localhost:3000/sidekiq
- PostgreSQL: localhost:5432
- Redis: localhost:6379

## Docker Commands

```bash
# Start all services
bin/docker-dev up

# Stop all services
bin/docker-dev down

# Rebuild images
bin/docker-dev build

# Run Rails console
bin/docker-dev console

# Access bash shell
bin/docker-dev bash

# Run migrations
bin/docker-dev migrate
```

## Database Setup

This application uses TWO databases:

1. **Local PostgreSQL** (managed by Docker)
   - For Rails models, migrations, sessions
   - Automatically created by docker-compose

2. **Supabase PostgreSQL** (remote)
   - For company data (read-only)
   - Configure credentials in `.env`
   - Models inherit from `SupabaseRecord` to use this connection

## Architecture

- **Web**: Rails application server
- **Sidekiq**: Background job processor
- **Tailwind**: CSS compilation watcher
- **PostgreSQL**: Local development database
- **Redis**: Cache and job queue

## Troubleshooting

### Port conflicts
If port 3000 is already in use:
```bash
lsof -i :3000
kill -9 <PID>
```

### Database connection issues
Check your `.env` file has the correct Supabase password.

### Docker issues
```bash
docker-compose logs web
docker-compose logs db
```

## Next Steps

After setup, create GitHub issues for features and use the Claude Code workflow:
```
/issue 1
```