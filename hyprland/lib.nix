{ lib }:
let
  listKeys = [
    "animation"
    "bezier"
    "bind"
    "bindel"
    "bindl"
    "bindm"
    "env"
    "exec-once"
    "monitor"
    "windowrulev2"
    "workspace"
  ];

  mergeListKey = key: left: right:
    (left.${key} or [ ]) ++ (right.${key} or [ ]);

  clearListKey = key: attrs:
    builtins.removeAttrs attrs [ key ];
in {
  mergeHyprSettings = left: right:
    let
      base = lib.recursiveUpdate
        (builtins.foldl' (acc: key: clearListKey key acc) left listKeys)
        (builtins.foldl' (acc: key: clearListKey key acc) right listKeys);
      mergedLists = lib.genAttrs listKeys (key: mergeListKey key left right);
    in
      base // lib.filterAttrs (_: value: value != [ ]) mergedLists;
}
