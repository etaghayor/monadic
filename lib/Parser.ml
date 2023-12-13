(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

module Base = struct
  type 'a res = Val of 'a * char list | Err
  type 'a t = char list -> 'a res

  let return a = failwith "NYI"
  let bind m f = failwith "NYI"
end

module M = Monad.Expand (Base)
include M
open Base

let fail () = failwith "NYI"
let any () = failwith "NYI"
let empty () = failwith "NYI"
let symbol c = failwith "NYI"
let either m1 m2 = failwith "NYI"
let optionally m = failwith "NYI"

let rec star m = failwith "NYI"
and plus m = failwith "NYI"

let run m toks = failwith "NYI"

(* TODO: add a backtracking operator? *)
