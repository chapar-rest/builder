FROM golang:1.23.4-alpine as builder
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.58.2

FROM golang:1.23.4-alpine
RUN apk add wayland-dev libx11-dev mesa-dev libffi-dev libxcursor-dev vulkan-headers build-base libxcb-dev libxkbcommon-dev
COPY --from=builder /go/bin/golangci-lint /usr/local/bin/golangci-lint
