open Monads

type value = IsNat of int | IsBool of bool

type exp =
  | Val of value
  | Eq of exp * exp
  | Plus of exp * exp
  | Ifte of exp * exp * exp

val sem : exp -> value Error.t
