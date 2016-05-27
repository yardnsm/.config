# --------------------------------------- #
# | Get the versions of some environments
# --------------------------------------- #

# All versions
function versions_info() {
    echo "$(version_node) "
}

# Get nodejs version if there is a 'package.json' file
function version_node () {
    [[ ! -f "$(pwd)/package.json" ]] && return
    local node_version=$(node -v 2>/dev/null)
    [[ ! -z "${node_version}" ]] && echo "${THEME_VERSION_NODEJS_PREFIX}${node_version:1}${THEME_VERSION_NODEJS_SUFFIX}"
}
