(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

module Base = struct
  type 'a t = 'a list

  let return a = failwith "NYI"
  let bind m f = failwith "NYI"
end

module M = Monad.Expand (Base)
include M

let fail () = failwith "NYI"
let either a b = failwith "NYI"
let run m = failwith "NYI"
let all m = failwith "NYI"
