# Dependencies

The following tools are required to develop and run the stack locally:

- **Docker & Docker Compose** – container runtime and orchestration
- **GNU Make** – convenience commands defined in the `Makefile`
- **mkcert** (optional) – generate local CA certificates for HTTPS testing
- **Helm** (optional) – linting and dependency management for Helm charts

At runtime the application relies on:

- **FreshRSS** – lightweight RSS reader written in PHP
- **PostgreSQL** – relational database used for storage
