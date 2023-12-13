(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-20-27-32-37-39"]
[@@@warning "-38"]

type value = IsNat of int | IsBool of bool

type exp =
  | Val of value
  | Eq of exp * exp
  | Plus of exp * exp
  | Ifte of exp * exp * exp

exception IllTyped

let ( let* ) _ _ = failwith "NYI: bring me in scope!"
let return _ = failwith "NYI: bring me in scope!"
let run _ = failwith "NYI: bring me in scope!"
let rec sem e = failwith "NYI"

(** * Tests *)

let%test _ = run (sem (Val (IsNat 42))) = IsNat 42
let%test _ = run (sem (Eq (Val (IsBool true), Val (IsBool true)))) = IsBool true
let%test _ = run (sem (Eq (Val (IsNat 3), Val (IsNat 3)))) = IsBool true

let%test _ =
  run (sem (Eq (Val (IsBool true), Val (IsBool false)))) = IsBool false

let%test _ = run (sem (Eq (Val (IsNat 42), Val (IsNat 3)))) = IsBool false

let%test _ =
  (* Alternatively: one could have an exception *)
  run (sem (Eq (Val (IsNat 42), Val (IsBool false)))) = IsBool false

let%test _ = run (sem (Plus (Val (IsNat 42), Val (IsNat 3)))) = IsNat 45

let%test _ =
  run (sem (Ifte (Val (IsBool true), Val (IsNat 42), Val (IsNat 3)))) = IsNat 42

let%test _ =
  run (sem (Ifte (Val (IsBool false), Val (IsNat 42), Val (IsNat 3)))) = IsNat 3

let%test _ =
  run
    (sem
       (Ifte
          ( Eq (Val (IsNat 21), Plus (Val (IsNat 20), Val (IsNat 1))),
            Val (IsNat 42),
            Val (IsNat 3) )))
  = IsNat 42

(** ** Ill-typed expressions *)

let%test _ =
  try
    ignore (run (sem (Plus (Val (IsBool true), Val (IsNat 3)))));
    false
  with
  | IllTyped -> true
  | _ -> false

let%test _ =
  try
    ignore (run (sem (Ifte (Val (IsNat 3), Val (IsNat 42), Val (IsNat 44)))));
    false
  with
  | IllTyped -> true
  | _ -> false
