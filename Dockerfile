FROM alpine AS build
WORKDIR /loop
RUN apk add --no-cache curl \
 && curl -sL https://github.com/stepro/dcwatch/releases/download/v0.1.0/dcwatch-linux-amd64 > watch \
 && apk del curl
COPY . .
RUN chmod +x *

FROM busybox
COPY --from=build /loop /loop