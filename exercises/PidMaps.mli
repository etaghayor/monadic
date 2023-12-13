open Monads.Parser

(* Library combinators *)

val symbol : char -> unit t
val one_of : char list -> char t
val star : 'a t -> 'a list t
val plus : 'a t -> 'a list t

(* Parser *)

val hex_digit : unit -> char t
val hex_number : unit -> string t
val parse_address : unit -> (string * string) t
val parse_perms : unit -> (bool * bool * bool * char) t
val parse_device : unit -> (string * string) t
val parse_path : unit -> string t

val parse_region :
  unit ->
  ((string * string)
  * (bool * bool * bool * char)
  * string
  * (string * string)
  * string
  * string)
  t
