{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "MichaelFisher1997";
        email = "contact@michaelfisher.tech";
      };
      alias = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };
  };
}