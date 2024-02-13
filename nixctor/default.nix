{ constructProgram ? import ./ctor.nix }:
constructProgram {
  pname = "hello-world";
  version = "1.0.0";

  src = ./.; # use the current directory

  sourceFiles = [ "main.c" "lib.c" ];
}
