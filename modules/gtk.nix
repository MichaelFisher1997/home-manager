{ pkgs, ... }:

let
  gtkThemeName = "Breeze-Dark";
  iconThemeName = "breeze-dark";
  cursorThemeName = "Bibata-Modern-Ice";
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
      package = pkgs.kdePackages.breeze-gtk;
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
