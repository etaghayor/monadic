(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

module Base = struct
  type 'a t = OK of 'a | Err of exn

  let return a = OK a
  let bind m f = match m with 
    | Err exn -> Err exn
    | OK a -> f a
  end

module M = Monad.Expand (Base)
include M
open Base

let err e = Err e
let try_with_finally m ks kf =
   match m with 
    | OK a -> ks a
    | Err exn -> kf exn
    
let run m = failwith "NYI"
