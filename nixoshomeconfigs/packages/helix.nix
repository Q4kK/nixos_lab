{ pkgs, ... }:
{
  environment.systemPackages =
  let
    custom-helix = pkgs.stdenv.mkDerivation {
      name = "custom-helix";
      srcs = [];
      buildInputs = [
        pkgs.helix
        pkgs.makeWrapper
      ];
      installPhase = ''
      mkdir $out/bin -p

      ln -s ${pkgs.helix}/bin/hx $out/bin/hx

      wrapProgram $out/bin/hx \
        --add-flags "-c ${../dotfiles/helix/config.toml}"
      '';
      dontUnpack = true;
    };
  in [
    custom-helix
  ];
  environment.etc."helix/config.toml".source = ../dotfiles/helix/config.toml;
}
