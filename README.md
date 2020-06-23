
# skiff-template

Welcone to the SPIKE-SciBERT similarity search demo on the CORD-19 dataset. 

## Prerequisites

Make sure that you have the latest version of [Docker 🐳](https://www.docker.com/get-started)
installed on your local machine.

## Getting Started


To start a version of the application locally for development purposes, run
this command:

```
~ docker-compose up --build
```

This process launches 2 services, the `api` and a `proxy` responsible
for forwarding traffic to the appropriate services.

The demo runs on `localhost:8080`.
