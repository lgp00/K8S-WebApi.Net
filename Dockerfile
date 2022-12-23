FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["K8S-WebApi.Net/RainyDays/RainyDays.csproj", "K8S-WebApi.Net/RainyDays/"]
RUN dotnet restore "RainyDays/RainyDays.csproj"
COPY . .
WORKDIR "/src/RainyDays"
RUN dotnet build "RainyDays.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "RainyDays.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "RainyDays.dll"]
