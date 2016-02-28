# Atom's init script
process.nextTick ->
  atom.workspace.getPaneItems().forEach ->
    atom.workspace.destroyActivePaneItem()
