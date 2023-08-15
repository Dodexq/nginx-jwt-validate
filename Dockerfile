FROM fabiocicerchia/nginx-lua:1.25.1-ubuntu22.04

COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY nginx-jwt-auth.lua /usr/local/share/nginx-jwt-auth.lua

RUN apt-get update && apt-get install -y gcc
RUN luarocks install lua-cjson && luarocks install basexx && luarocks install luaossl

EXPOSE 80