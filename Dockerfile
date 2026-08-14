FROM ://microsoft.com AS build
WORKDIR /app

# Copy all repository files into the container
COPY . ./
RUN dotnet publish -c Release -o out

# Build the small live runtime image
FROM ://microsoft.com
WORKDIR /app
COPY --from=build /app/out .
EXPOSE 10000
ENV ASPNETCORE_URLS=http://+:10000
ENTRYPOINT ["dotnet", "TextingApp.dll"]
