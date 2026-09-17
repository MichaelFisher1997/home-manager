{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (import ./quickshell-palette.nix) fromCatppuccin;

  gtkThemeName = "Quickshell-Dark";
  iconThemeName = "breeze-dark";
  cursorThemeName = "Bibata-Modern-Ice";

  upstreamTheme = pkgs.magnetic-catppuccin-gtk.override {
    accent = [ "blue" ];
    shade = "dark";
    tweaks = [ "black" ];
  };

  sedHex =
    lib.concatMapStrings
      (
        pair:
        "-e 's/#${pair.from}/#${pair.to}/g' -e 's/#${lib.toUpper pair.from}/#${lib.toUpper pair.to}/g' "
      )
      (
        lib.mapAttrsToList (from: to: {
          inherit from;
          inherit to;
        }) fromCatppuccin
      );

  # rgba() colors the theme uses directly, as "R, G, B" triplets.
  sedRgb = lib.concatMapStrings (pair: "-e 's/${pair.from}/${pair.to}/g' ") [
    {
      from = "239, 241, 245";
      to = "191, 201, 219";
    }
    {
      from = "30, 30, 46";
      to = "15, 15, 23";
    }
    {
      from = "24, 24, 37";
      to = "10, 10, 16";
    }
    {
      from = "18, 18, 28";
      to = "8, 8, 12";
    }
    {
      from = "35, 38, 52";
      to = "34, 36, 43";
    }
    {
      from = "65, 69, 89";
      to = "46, 49, 58";
    }
    {
      from = "118, 119, 128";
      to = "107, 114, 128";
    }
    {
      from = "137, 180, 250";
      to = "161, 189, 206";
    }
    {
      from = "130, 171, 237";
      to = "179, 204, 219";
    }
    {
      from = "30, 102, 245";
      to = "161, 189, 206";
    }
    {
      from = "210, 15, 57";
      to = "224, 108, 117";
    }
  ];

  quickshellGtk = pkgs.runCommand "quickshell-gtk-theme" { } ''
    themeDir=$out/share/themes/${gtkThemeName}
    mkdir -p $out/share/themes
    cp -r ${upstreamTheme}/share/themes/Catppuccin-GTK-Blue-Dark $themeDir
    chmod -R u+w $themeDir
    cd $themeDir
    find . -type f \( -name '*.css' -o -name '*.rc' -o -name 'gtkrc' \) -print0 |
      xargs -0 sed -i ${sedHex} ${sedRgb}
    sed -i \
      -e 's/^Name=.*/Name=${gtkThemeName}/' \
      -e 's/^GtkTheme=.*/GtkTheme=${gtkThemeName}/' \
      -e 's/^MetacityTheme=.*/MetacityTheme=${gtkThemeName}/' \
      -e 's/^IconTheme=.*/IconTheme=${iconThemeName}/' \
      -e 's/^CursorTheme=.*/CursorTheme=${cursorThemeName}/' \
      index.theme
  '';
in
{
  gtk = {
    enable = true;

    font = {
      name = "Noto Sans";
      size = 10;
    };

    theme = {
      name = gtkThemeName;
      package = quickshellGtk;
    };

    iconTheme = {
      name = iconThemeName;
      package = pkgs.kdePackages.breeze-icons;
    };

    cursorTheme = {
      name = cursorThemeName;
      package = pkgs.bibata-cursors;
      size = 24;
    };

    gtk4.theme = config.gtk.theme;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-primary-button-warps-slider = true;
      gtk-xft-dpi = 122880;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-primary-button-warps-slider = true;
      gtk-xft-dpi = 122880;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "slate";
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = cursorThemeName;
      document-font-name = "Noto Sans 10";
      font-name = "Noto Sans 10";
      gtk-theme = gtkThemeName;
      icon-theme = iconThemeName;
      monospace-font-name = "Iosevka 10";
    };
  };
}
