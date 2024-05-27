set -Ux http_proxy http://127.0.0.1:8081/
set -Ux https_proxy $http_proxy
set -Ux ftp_proxy $http_proxy
set -Ux rsync_proxy $http_proxy
set -Ux no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
