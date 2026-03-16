---
name: rust-microservice-development
description: "best practice for rust microservice development"
metadata:
  tags: rust, axum, serde, tokio
---

## When to use

Use this skill when you need to:
- Develop a microservice based on Rust
- The microservice expose a REST API

## Preferred dependencies

Use Axum for exposing service.

If the entrypoint is configurable by a config file, use hyper

The lastest version is often the best option.

## Generating the Dockerfile

There are 2 kind of Dockerfile:
- build for release
- build for developing and integration testing

### Dockerfile for release

Use 2-stage build. The first stage is with rust toolchain image, building a static binary.

The second stage is on scratch base image for security.

For development image, it is requested before real release, the second stage include some light and useful tool: busybox for doing sh and other staff.

### Dockerfile for integration testing

The file is named Dockerfile.integrate
It is a 1-stage image: the base image contains the rust toolchain, and other utilities to do ssh, git, wget, maybe mysql (if required)


