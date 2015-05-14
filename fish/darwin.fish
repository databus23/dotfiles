#osx specific init stuff
set -x EDITOR (which mvim)" -f"
set -x BUNDLER_EDITOR (which mvim)

set netloc (/usr/sbin/scselect 2>&1 | egrep '^ \*' | sed 's:.*(\(.*\)):\1:'|tr [A-Z] [a-z])

# source host specific config
#if functions -q $netloc"_env"
#  echo "Loading $netloc environment"
#  eval $netloc"_env"
#else
#  echo "Loading default env"
#  default_env
#end
