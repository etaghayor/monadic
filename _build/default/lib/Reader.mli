module Make (Env : sig
  type t
end) : sig
  type 'a t

  (* Structure *)

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t

  (* Operations *)

  val get : unit -> Env.t t
  val local : Env.t -> 'a t -> 'a t

  (* Runner *)

  val run : 'a t -> Env.t -> 'a
end
