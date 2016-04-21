# Atom's init script

# --------------------------------------------- #
# | Close EVERYTHING at startup
# --------------------------------------------- #

# Close all tabs at startup
process.nextTick ->
    atom.workspace.getPaneItems().forEach ->
        atom.workspace.destroyActivePaneItem()

# Close the tree at Startup
#workspaceView = atom.views.getView(atom.workspace)
#atom.commands.dispatch workspaceView, 'tree-view:toggle'

# --------------------------------------------- #
# | Set dimensions
# --------------------------------------------- #
#process.nextTick ->
#    atom.setWindowDimensions({"width": 1300, "height": 700})

# --------------------------------------------- #
# | Exit fullscreen
# --------------------------------------------- #
#process.nextTick ->
#    atom.setFullScreen(false)
