FROM golang:1.10-alpine as build
RUN apk add -U --no-cache git
RUN go get github.com/gohugoio/hugo
COPY . /go/src/github.com/stellarproject/causeway
WORKDIR /go/src/github.com/stellarproject/causeway
RUN hugo -t default -D --cleanDestinationDir --forceSyncStatic

FROM nginx:alpine
COPY --from=build /go/src/github.com/stellarproject/causeway/public/ /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html
