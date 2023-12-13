(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

module Make (Ans : sig
  type t
end) =
struct
  module Base = struct
    type 'a t = ('a -> Ans.t) -> Ans.t

    let return a = failwith "NYI"
    let bind m f = failwith "NYI"
  end

  module M = Monad.Expand (Base)
  include M

  let callcc f = failwith "NYI"
  let throw m k' = failwith "NYI"
  let tfix mrec a = failwith "NYI"
  let run m = failwith "NYI"
end
