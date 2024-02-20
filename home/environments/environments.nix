{ lib, ... }:
let
  languages = [
    "R"
    "godot"
    "haskell"
    "julia"
    "misc"
    "nix"
    "python"
  ];
  languageToAttrs = lang: {
    "Code/${lang}/.envrc".text = "use nix";
    "Code/${lang}/tmp/README.md".text = ''
      # Environment directories
      Run `direnv allow` to get started.
    '';
  };
  languageAttrs = lib.mkMerge (map languageToAttrs languages);
in
{
  home.file = languageAttrs;
}
