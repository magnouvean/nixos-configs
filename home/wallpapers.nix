{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  name = "wallpapers";
  version = "1.0.0";
  srcs = [
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/1121123/pexels-photo-1121123.jpeg";
      sha256 = "sha256-kfv4Ig/6gGNfxtk6EdHI4Xs1PGldbavxezF01qpZUO8=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/114979/pexels-photo-114979.jpeg";
      sha256 = "sha256-y/F4YAk+9LcalwBdzT19UHCnOGP0hJsN/p4dj3guUjY=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/3109850/pexels-photo-3109850.jpeg";
      sha256 = "sha256-ot2QgaF5jdmAy/2QQmodCzMEN+mq/Ojryab6emzoB3I=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/1603891/pexels-photo-1603891.jpeg";
      sha256 = "sha256-j5zr/l+ayHmgZXf5e2qIGfGvuFoRqmtBYzPdtA1YTKY=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/2719301/pexels-photo-2719301.jpeg";
      sha256 = "sha256-KScXnyYInXB55rcxU6GVeSW98StV32jsFxZWTtHg8E0=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/3337219/pexels-photo-3337219.jpeg";
      sha256 = "sha256-CqUASupI3FKs7o1izS4xqk1ggPjaJ0XNiCiIY2LzxpA=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/2166919/pexels-photo-2166919.jpeg";
      sha256 = "sha256-EcvvH01V4lBerTA5sqTrJaEHPyRyaH3ZnMq6zO4fD9c=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/3527795/pexels-photo-3527795.jpeg";
      sha256 = "sha256-/fi2nubqxfHh1oHbENkna0tVl/Ayu3pJi/5LYACySa4=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/3110509/pexels-photo-3110509.png";
      sha256 = "sha256-FcBsHEkAAR298SPME9kA0fgLid6cVX6NgIF4nqGhl+U=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/7787715/pexels-photo-7787715.jpeg";
      sha256 = "sha256-UiraPSzhQq9za3mqnWWZJIChAWIfVoYd1cDLHDc6kt0=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/59992/crocus-flower-spring-purple-59992.jpeg";
      sha256 = "sha256-erFypzRxWdeX3EOut7GVAfyCkxuSTg44cXO0LJM8cn0=";
    })
  ];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/wallpapers/
    for img in ${pkgs.lib.concatStringsSep " " srcs}; do
      cp $img $out/share/wallpapers
    done
  '';
}
