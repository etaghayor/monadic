(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-26-27-32-33-37-39"]

open Monads
open Random

module Example (M : ProbMonad) = struct
  open M

  let dice num_sides =
    let* n = rand num_sides in
    return (n + 1)

  let roll_3d6 =
    let* d1 = dice 6 in
    let* d2 = dice 6 in
    let* d3 = dice 6 in
    return (d1 + d2 + d3)
end

module E1 = Example (MonteCarlo)

let%test _ =
  let r = MonteCarlo.run E1.roll_3d6 in
  failwith "NYI: write a meaningful test here"

module E2 = Example (Distribution)

let ( =~ ) p1 p2 =
  (* https://github.com/ocaml-batteries-team/batteries-included/blob/879c49663126702ce0388df4b0fb01303f184810/src/batFloat.ml *)
  abs_float (p1 -. p2) < 1e-5

let%test _ =
  let r = Distribution.run E2.roll_3d6 in
  failwith "NYI: write a meaningful test here"

module E3 = Example (Expectation)

let%test _ =
  let r = Expectation.run E3.roll_3d6 in
  failwith "NYI: write a meaningful test here"
