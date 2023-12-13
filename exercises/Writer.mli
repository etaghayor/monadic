open Monads
open Monoid

(* TODO: could I somehow reuse the definition in lib/Writer.mli? *)

module Make (Log : Monoid) : sig
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
