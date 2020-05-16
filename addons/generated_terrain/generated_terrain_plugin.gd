tool
extends EditorPlugin


func _enter_tree():
  add_custom_type("GeneratedTerrain",
                  "MeshInstance",
                  preload("generated_terrain.gd"),
                  preload("generated_terrain.png"))


func _exit_tree():
  remove_custom_type("GeneratedTerrain")
