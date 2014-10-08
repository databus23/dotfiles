function webserver
  set -l port 8000
  test  (count $argv) -gt 0; and set port $argv[1]
  echo Serving (pwd) on port $port ...
  ruby -run -e httpd -- -p $port .
end
