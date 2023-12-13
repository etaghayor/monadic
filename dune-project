(lang dune 3.8)

(name mpri24-monads)

(generate_opam_files true)

(authors "Pierre-Evariste DAGAND")
(maintainers "Pierre-Evariste DAGAND")
(license MIT)

(package
 (name mpri24-monads)
 (allow_empty) ; https://discuss.ocaml.org/t/dune-the-package-xxx-does-not-have-any-user-defined-stanzas-attached-to-it/9859
 (synopsis "Basic monads")
 (description "Examples covered in class")
 (depends ocaml ocamlformat dune ppx_inline_test))
