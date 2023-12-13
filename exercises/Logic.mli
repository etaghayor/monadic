open Monads
module M : Monad.Monad

type bot = |
type 'a not = 'a -> bot

val exfalso : unit -> ('a, 'a not) result M.t
