(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

open Monads

type bot = |
type 'a not = 'a -> bot

module M = Continuation.Make (struct
  type t = bot
end)

open M

let exfalso () = failwith "NYI"
