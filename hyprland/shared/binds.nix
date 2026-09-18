{ lib, vars }:
let
  lua = lib.generators.mkLuaInline;
  mkBind = key: dispatcher: flags: {
    _args = [ key (lua dispatcher) ] ++ lib.optional (flags != null) flags;
  };
  modBind = key: dispatcher: flags:
    mkBind (lua ''mainMod .. " + ${key}"'') dispatcher flags;
  exec = command: "hl.dsp.exec_cmd(${builtins.toJSON command})";
  workspaceBinds = lib.concatMap (workspace:
    let
      number = toString workspace;
      key = if workspace == 10 then "0" else number;
    in [
      (modBind key ''hl.dsp.focus({ workspace = "${number}" })'' null)
      (modBind "SHIFT + ${key}" ''hl.dsp.window.move({ workspace = "${number}" })'' null)
    ]) (lib.range 1 10);
in {
  bind = [
    (modBind "X" "hl.dsp.exec_cmd(terminal)" null)
    (modBind "Q" "hl.dsp.window.close()" null)
    (modBind "E" "hl.dsp.exec_cmd(fileManager)" null)
    (modBind "V" ''hl.dsp.layout("togglesplit")'' null)
    (modBind "R" "hl.dsp.exec_cmd(menu)" null)
    (modBind "B" (exec "zen-twilight") null)
    (modBind "SHIFT + B" (exec "sh -c 'pgrep -x hyprsunset >/dev/null && { hyprctl hyprsunset reset; pkill -x hyprsunset; } || hyprsunset >/tmp/hyprsunset.log 2>&1 &'") null)
    (modBind "P" "hl.dsp.window.pseudo()" null)
    (modBind "F" ''hl.dsp.window.float({ action = "toggle" })'' null)
    (modBind "N" "hl.dsp.window.fullscreen()" null)
    (modBind "space" ''hl.dsp.window.float({ action = "toggle" })'' null)
    (modBind "L" (exec "hyprlock") null)
    (modBind "XF86MonBrightnessDown" (exec "hyprctl hyprsunset gamma -10") null)
    (modBind "XF86MonBrightnessUp" (exec "hyprctl hyprsunset gamma +10") null)
    (mkBind "ALT + C" (exec "hyprshot -m region -o ${vars.user.homeDirectory}/Pictures/hyprshots") null)
    (mkBind "ALT + SHIFT + C" (exec "hyprshot -m window -o ${vars.user.homeDirectory}/Pictures/hyprshots") null)
    (mkBind "CTRL + ALT + C" (exec "hyprshot -m output -m active -o ${vars.user.homeDirectory}/Pictures/hyprshots") null)
    (modBind "left" ''hl.dsp.focus({ direction = "left" })'' null)
    (modBind "right" ''hl.dsp.focus({ direction = "right" })'' null)
    (modBind "up" ''hl.dsp.focus({ direction = "up" })'' null)
    (modBind "down" ''hl.dsp.focus({ direction = "down" })'' null)
  ] ++ workspaceBinds ++ [
    (modBind "S" ''hl.dsp.workspace.toggle_special("magic")'' null)
    (modBind "SHIFT + S" ''hl.dsp.window.move({ workspace = "special:magic" })'' null)
    (modBind "mouse_down" ''hl.dsp.focus({ workspace = "e-1" })'' null)
    (modBind "mouse_up" ''hl.dsp.focus({ workspace = "e+1" })'' null)
    (modBind "mouse:272" "hl.dsp.window.drag()" { mouse = true; })
    (modBind "mouse:273" "hl.dsp.window.resize()" { mouse = true; })
  ];
}
