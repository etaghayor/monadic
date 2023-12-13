type 'a t

(* Structure *)

val return : 'a -> 'a t
val bind : 'a t -> ('a -> 'b t) -> 'b t
val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t (* à la ML *)

(* Operations *)

val fail : unit -> 'a t
val any : unit -> char t
val empty : unit -> unit t
val either : 'a t -> 'a t -> 'a t

(* Runner *)

val run : 'a t -> char list -> 'a
