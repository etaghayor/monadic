type 'a t

(* Structure *)

val return : 'a -> 'a t
val bind : 'a t -> ('a -> 'b t) -> 'b t
val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t (* à la ML *)

(* Operations *)

val err : exn -> 'a t
val try_with_finally : 'a t -> ('a -> 'b t) -> (exn -> 'b t) -> 'b t

(* Runner *)

val run : 'a t -> 'a
