FROM alpine:3.14.1 as base
RUN apk add curl bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib
RUN mkdir -p /usr/share/dotnet
RUN cd /usr/share/dotnet && curl https://dotnet.microsoft.com/download/dotnet/thank-you/runtime-aspnetcore-2.2.8-linux-x64-alpine-binaries | sed -n 's:^.*window.open("\([^"]*\)".*$:\1:p'| xargs curl -O && tar zxf *.gz && rm *.gz
ENV PATH "$PATH:/usr/share/dotnet"
ENV DOTNET_ROOT /usr/share/dotnet