# dotnet 7 does not cross-compile under QEMU, so the build stage follows the
# machine running the build and publishes for TARGETARCH.
# hadolint ignore=DL3029
FROM --platform=${BUILDPLATFORM} mcr.microsoft.com/dotnet/sdk:7.0.410 AS build
ARG TARGETPLATFORM
ARG TARGETARCH
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

WORKDIR /source
COPY *.csproj .
RUN dotnet restore -a $TARGETARCH

COPY . .
RUN dotnet publish -c release -o /app -a $TARGETARCH --self-contained false --no-restore

FROM mcr.microsoft.com/dotnet/runtime:7.0.20 AS final
WORKDIR /app
RUN adduser --disabled-password --gecos "" --uid 10001 appuser
COPY --from=build --chown=appuser:appuser /app .
USER appuser
ENTRYPOINT ["dotnet", "Worker.dll"]
