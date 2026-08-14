FROM ://microsoft.com AS build
WORKDIR /app

# Copy everything and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM ://microsoft.com
WORKDIR /app
COPY --from=build /app/out .
EXPOSE 10000
ENV ASPNETCORE_URLS=http://+:10000
ENTRYPOINT ["dotnet", "TextingApp"]
