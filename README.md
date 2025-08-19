# freshrss-application

An experimental playground for running [FreshRSS](https://freshrss.org/) with a
PostgreSQL backend.  The repository packages the application and database in a
single Docker Compose stack and ships the documentation used by the
development team.

## Setup

1. Copy `.env.example` to `.env` and adjust values if needed.
2. Start the stack:

   ```sh
   make start
   # or
   docker-compose up -d
   ```

3. Open [http://localhost:8080](http://localhost:8080) and follow the FreshRSS
   installation wizard.

## Dependencies

- Docker and Docker Compose
- GNU Make
- Optional: [mkcert](https://github.com/FiloSottile/mkcert) for local HTTPS

## Tech Stack

- [FreshRSS](https://freshrss.org/) – self‑hosted RSS reader
- [PostgreSQL](https://www.postgresql.org/) – persistent storage
- Docker Compose – container orchestration


##### Possible next extensions:
https://framagit.org/nicofrand/xextension-threepanesview
https://github.com/tryallthethings/freshvibes?tab=readme-ov-file
https://github.com/giventofly/freshrss-comicsinfeed