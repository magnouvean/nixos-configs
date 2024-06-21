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
      url = "https://images.pexels.com/photos/3109850/pexels-photo-3109850.jpeg";
      sha256 = "sha256-ot2QgaF5jdmAy/2QQmodCzMEN+mq/Ojryab6emzoB3I=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/2166919/pexels-photo-2166919.jpeg";
      sha256 = "sha256-EcvvH01V4lBerTA5sqTrJaEHPyRyaH3ZnMq6zO4fD9c=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/7787715/pexels-photo-7787715.jpeg";
      sha256 = "sha256-UiraPSzhQq9za3mqnWWZJIChAWIfVoYd1cDLHDc6kt0=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/59992/crocus-flower-spring-purple-59992.jpeg";
      sha256 = "sha256-erFypzRxWdeX3EOut7GVAfyCkxuSTg44cXO0LJM8cn0=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/2690766/pexels-photo-2690766.jpeg";
      sha256 = "sha256-jJ1Czy7nX0JkjzterOY3Y9T1UdaPDpf5eb8SKf98cAY=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/594233/pexels-photo-594233.jpeg";
      sha256 = "sha256-slKs+sPOWn6rW9C/3tL+mXVibXG2vuFZT2FQOv8IZ5Y=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/10874585/pexels-photo-10874585.jpeg";
      sha256 = "sha256-wanVbfMEtx9ipf2+Bd0OmbbvDSMzasG2vfBwqYwWayU=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/12759110/pexels-photo-12759110.jpeg";
      sha256 = "sha256-Pby7LFeRIYtXSOB0PAK9I6S9EpstIPdSSPph350J8YA=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/5899474/pexels-photo-5899474.jpeg";
      sha256 = "sha256-rQiPxXue4cP6Nj/EnOvv2ZAKfnSFaJsd1BYENPKZiLc=";
    })
    (pkgs.fetchurl {
      url = "https://images.pexels.com/photos/355762/pexels-photo-355762.jpeg";
      sha256 = "sha256-yMdbn9aLVNMVg8/Wc1g2lNVPg7YNVpRNY7FjPEwlbRk=";
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
