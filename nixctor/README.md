## ctor.nix - C/C++/D buildsystem written in Nixlang

Here is a buildsystem I made that incrementally compiles a program and
then links it together at the end. The file default.nix shows an
example on how to use this code in a real derivation, it's as simple
as just adding your source files into the `sourceFiles` array and
ctor.nix will generate a build phase and an install phase for you. It
just calls `stdenv.mkDerivation` so you'll have to supply the required
arguments to that too.

To test:

    nix-build

To use a different compiler or flags, you can use the `compiler` and
`cflags` arguments:

```nix
# Example for a D program
constructProgram {
  pname = "hello-world";
  version = "1.0.0";
  
  src = fetchFromWhatever {};

  compiler = "ldc2";
  cflags = "-O -wi";
  sourceFiles = [ "main.d" "lib.d" ];
}
```
