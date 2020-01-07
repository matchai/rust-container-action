FROM rust:latest as builder

WORKDIR /app
COPY . /app

# Statically compile to allow for use in a distroless container
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo build --target x86_64-unknown-linux-musl --release

FROM gcr.io/distroless/static

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/app /app

ENTRYPOINT [ "/app" ]
