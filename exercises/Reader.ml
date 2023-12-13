(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-32-33"]

open Monads

module Make (Env : sig
  type t

  val init : t
end) =
struct
  (* Use the Update monad to instantiate the following definitions *)

  type 'a t = |

  (* NYI: bring me in scope! *)

  let return _ = failwith "NYI: bring me in scope!"
  let bind _ _ = failwith "NYI: bring me in scope!"
  let ( >>= ) _ _ = failwith "NYI: bring me in scope!"
  let ( let* ) _ _ = failwith "NYI: bring me in scope!"
  let get _ = failwith "NYI: bring me in scope!"
  let run _ = failwith "NYI: bring me in scope!"
end
