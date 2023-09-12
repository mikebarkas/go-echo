# Go-Echo

A project for learning about building Docker images and running Docker containers for a simple web server.

---
## Simple Example

Use the `Dockerfile.multistage` to build `main.go` run the image in a container and map to port 8080.

Simple example URLs:
* `/` returns hello in HTML
* `/json` returns hello in JSON
* `/param?param=whatever` returns "whatever" param to the page

---

## Database Example

Use the `docker-compose.yml` file to start server (from `Dockerfile.server`) and a CockroachDB container.

The database will have persistent data with a Volume.

> **Note**: create a table and user in the database.

Database example URLs:
* `/` returns hello with a count of "messages"
* `/ping` return JSON "OK"
* `/send` POST JSON containing `{"value": string}`

---

