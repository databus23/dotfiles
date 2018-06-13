function webserver
  set -l port 8000
  set -l dir (pwd)
  test  (count $argv) -gt 0; and set port $argv[1]
  test  (count $argv) -gt 1; and set dir $argv[2]
  echo Serving $dir on port $port ...
  ruby -run -e httpd -- -p $port $dir
end
