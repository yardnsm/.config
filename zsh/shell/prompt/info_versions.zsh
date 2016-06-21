# --------------------------------------- #
# | Values
# --------------------------------------- #

# NodeJS
local SYMBOL_VERSION_NODEJS="⬢"
local THEME_VERSION_NODEJS_PREFIX="%{$fg[green]%}[$SYMBOL_VERSION_NODEJS "
local THEME_VERSION_NODEJS_SUFFIX="]%{$reset_color%}"

# --------------------------------------- #
# | NodeJS
# --------------------------------------- #

# Get nodejs version if there is a 'package.json' file
function version_node () {
  [[ ! -f "$(pwd)/package.json" ]] && return
  local node_version=$(node -v 2>/dev/null)
  [[ ! -z "${node_version}" ]] && echo "${THEME_VERSION_NODEJS_PREFIX}${node_version:1}${THEME_VERSION_NODEJS_SUFFIX} "
}

# --------------------------------------- #
# | Primary thing
# --------------------------------------- #

# All verions
function info_versions() {
  echo "$(version_node)"
}
