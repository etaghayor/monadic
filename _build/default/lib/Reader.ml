(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

module Make (Env : sig
  type t
end) =
struct
  module Base = struct
    type 'a t = Env.t -> 'a

    let return a = failwith "NYI"
    let bind m f = failwith "NYI"
  end

  module M = Monad.Expand (Base)
  include M

  let get () = failwith "NYI"
  let local e m = failwith "NYI"
  let run m = failwith "NYI"
end
