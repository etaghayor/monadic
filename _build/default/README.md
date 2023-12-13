# lecture-MPRI-2.4-monads: student version

## Setup

Install [Opam](https://opam.ocaml.org/doc/Install.html), the OCaml
package manager, on your system. If you have never used Opam before,
you need to initialize it (otherwise, skip this step):

```
$ opam init
```

For convenience, we suggest setting a
[local](https://opam.ocaml.org/blog/opam-local-switches/) Opam
distribution, using the following commands:

```
$ opam switch create . --deps-only --with-doc --with-test
$ eval $(opam env)
```

## Development

Once your programming environment is setup, you can build the project with

```
$ dune build
```

You can also build and run the test suite with

```
$ dune runtest
```

If you want to run individual tests, use

```
./runtest.sh exercices/Bank.ml
```

to only run the inline tests in the file `exercices/Bank.ml`, or

```
./runtest.sh exercices/Bank.ml:60
```

to only run the inline test defined at line 60 in the file
`exercices/Bank.ml`.

## Order of business

Your host suggests that you complete the exercises in the following
order:
  1. `lib/Error.ml`
  1. `exercises/Interpreter.ml`
  1. `lib/State.ml`
  1. `exercises/ParsingGame.ml`
  1. `lib/Nondeterminism.ml`
  1. `exercises/Permutations.ml`
  1. Need practice? `lib/Parser.ml`
  1. Need practice? `exercises/PidMaps.ml`
  1. `lib/Continuation.ml`
  1. `exercises/Height.ml`
  1. `exercises/Logic.ml`
  1. `lib/Reader.ml`
  1. `lib/Writer.ml`
  1. `exercises/Logger.ml`
  1. `lib/Update.ml`
  1. `exercises/Bank.ml`
  1. `exercises/Dice.ml`
  1. `exercises/Writer.ml`
  1. `exercises/Reader.ml`
