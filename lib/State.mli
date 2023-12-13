module Make (S : sig
  type t
end) : sig
  type 'a t

  (* Structure *)

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t (* à la ML *)

  (* Operations *)

  val get : unit -> S.t t
  val set : S.t -> unit t

  (* Runner *)

  val run : 'a t -> S.t -> 'a
end
