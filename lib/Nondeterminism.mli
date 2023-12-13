type 'a t

(* Structure *)

val return : 'a -> 'a t
val bind : 'a t -> ('a -> 'b t) -> 'b t
val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t (* à la ML *)

(* Operations *)

val fail : unit -> 'a t
val either : 'a t -> 'a t -> 'a t

(* Runners *)

val run : 'a t -> 'a
val all : 'a t -> 'a Seq.t
