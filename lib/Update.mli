open Monoid

module Make (P : Monoid) (S : MonoidAction with type m = P.t) : sig
  type 'a t

  (* Structure *)

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t (* à la ML *)

  (* Operations *)

  val get : unit -> S.t t
  val set : P.t -> unit t

  (* Runner *)

  val run : 'a t -> S.t -> P.t * 'a
end
