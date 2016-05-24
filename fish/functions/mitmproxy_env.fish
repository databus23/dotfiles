function mitmproxy_env
  set -Ux http_proxy http://localhost:8080
  set -Ux https_proxy http://localhost:8080
  set -e ftp_proxy
  set -e all_proxy
  set -e no_proxy

end
