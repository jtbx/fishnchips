# ctor.nix: simple buildsystem written in Nix
# It can be adapted for any language, just substitute the default arguments
args @
{ pkgs ? import <nixpkgs> { }
, lib ? pkgs.lib
, stdenv ? pkgs.stdenv

# Name of the compiler to use when compiling source code
, compiler ? "cc"
# Flags passed to the compiler during compilation stages.
, cflags ? "-O2 -c"
# Flags passed to the compiler at link time
, ldflags ? ""
# Flag passed to the compiler to specify the output file
, outFlag ? "-o"
# Source code files to compile
, sourceFiles ? [ "main.c" ]
# Suffix of source code files
, suffix ? ".c"
# Name of the binary file to produce
, programName ? "main"

, ...
}:

with builtins;
let
  newline = "
";
  run = command: ''
    printf '%s\n' "${command}"
    ${command}
  '';
  objify = sourceFile: replaceStrings [ suffix ] [ ".o" ] sourceFile;
  compile = sourceFile:
    "${compiler} ${cflags} ${outFlag} ${objify sourceFile} ${sourceFile}";
  link = objs:
    "${compiler} ${outFlag} ${programName} ${concatStringsSep " " objs} ${ldflags}";
in
stdenv.mkDerivation ({
  buildPhase = ''
    runHook preBuild
    ${concatStringsSep newline (map
      (source: run (compile source)) sourceFiles)}
    ${run "${link (map objify sourceFiles)}"}
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm755 ${programName} $out/bin/${programName}
    runHook postInstall
  '';
} // args)
