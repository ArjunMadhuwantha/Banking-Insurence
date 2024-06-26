# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Bank-Insuarance.csproj", "."]
RUN dotnet restore "./Bank-Insuarance.csproj"

# Copy the entire application and build
COPY . .
WORKDIR "/src/."
RUN dotnet build "./Bank-Insuarance.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Add EF Core tools and apply migrations
RUN dotnet tool install --global dotnet-ef
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet ef database update --project ./Bank-Insuarance.csproj --startup-project ./Bank-Insuarance.csproj

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Bank-Insuarance.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Bank-Insuarance.dll"]


## See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
# USER app
# WORKDIR /app
# EXPOSE 8080
# EXPOSE 8081

# FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# ARG BUILD_CONFIGURATION=Release
# WORKDIR /src

# # Copy the project file and restore dependencies
# COPY ["Bank-Insurance/Bank-Insurance.csproj", "Bank-Insurance/"]
# RUN dotnet restore "./Bank-Insurance/Bank-Insurance.csproj"

# # Copy the entire application and build
# COPY . .
# WORKDIR "/src/Bank-Insurance"
# RUN dotnet build "./Bank-Insurance.csproj" -c $BUILD_CONFIGURATION -o /app/build

# # Add EF Core tools and apply migrations
# RUN dotnet tool install --global dotnet-ef
# ENV PATH="${PATH}:/root/.dotnet/tools"
# RUN dotnet ef database update --project ./Bank-Insurance.csproj --startup-project ./Bank-Insurance.csproj

# FROM build AS publish
# ARG BUILD_CONFIGURATION=Release
# RUN dotnet publish "./Bank-Insurance.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# FROM base AS final
# WORKDIR /app
# COPY --from=publish /app/publish .
# ENTRYPOINT ["dotnet", "Bank-Insurance.dll"]
