open Monoid

(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

module Make (P : Monoid) (S : MonoidAction with type m = P.t) = struct
  module Base = struct
    open P
    open S

    type 'a t = S.t -> P.t * 'a

    let return a = failwith "NYI"
    let bind m f = failwith "NYI"
  end

  module M = Monad.Expand (Base)
  include M

  let get () = failwith "NYI"
  let set p = failwith "NYI"
  let run m = failwith "NYI"
end
