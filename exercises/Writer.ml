open Monads
open Monoid

module Make (Log : Monoid) = struct
  (* Use the Update monad to instantiate the following definitions *)

  type 'a t = |

  (* NYI: bring me in scope! *)

  let return _ = failwith "NYI: bring me in scope!"
  let bind _ _ = failwith "NYI: bring me in scope!"
  let ( >>= ) _ _ = failwith "NYI: bring me in scope!"
  let ( let* ) _ _ = failwith "NYI: bring me in scope!"
  let set _ = failwith "NYI: bring me in scope!"
  let run _ = failwith "NYI: bring me in scope!"
end
