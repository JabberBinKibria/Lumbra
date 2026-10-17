# Lumbra (Godot 4.3+)

scripts/core   game logic, no nodes needed: unit, board_state, light_engine, rules (ALL tunables), turn_manager
scripts/board  look.gd (ALL colors/sizes/anim times), tile_layer, beam_layer, hit_marker_layer, unit_view, board_view
scripts/ui     hud, card_button, handoff_screen, game_over_screen, start_menu, settings (saved options)
scenes/units   one scene per piece (emitter, mirror, prism, blocker, veil) -> swap the Sprite2D texture
scenes/board   board_view.tscn = Tiles / Beams / HitMarkers / Units layers (give each layer its own shader)
scenes/ui      hud, card_button, handoff_screen, game_over_screen, start_menu (Play / Rules / Options)
scenes/fx      sound.tscn = all sounds (scripts/fx/sound.gd, files in assets/audio, every button clicks); background.tscn = animated light/shadow backdrop (layer -1); post_fx.tscn = vignette + film grain, above the board and below the UI
scenes/main    wires it together (main.gd) + WorldEnvironment glow
shaders        beam.gdshader (animated beams, on the Beams layer), background.gdshader, post_fx.gdshader

Add a new unit: new scene in scenes/units (copy one), add a Unit.Kind, register it in
board_view.gd UNIT_SCENES, Unit.NAMES/HINTS, light_engine.gd, and a deck entry in rules.gd.
