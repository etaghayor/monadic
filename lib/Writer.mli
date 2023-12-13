module Make (Log : sig
  type t

  val empty : t
  val ( <+> ) : t -> t -> t
end) : sig
  type 'a t

  (* Structure *)

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t

  (* Operations *)

  val set : Log.t -> unit t

  (* Runner *)

  val run : 'a t -> Log.t * 'a
end
