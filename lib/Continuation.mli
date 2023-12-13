module Make (Ans : sig
  type t
end) : sig
  type 'a t = ('a -> Ans.t) -> Ans.t

  (* Structure *)

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t

  (* Operations *)

  val callcc : (('a -> Ans.t) -> 'a t) -> 'a t
  val throw : 'a t -> ('a -> Ans.t) -> 'a t

  (* Runner *)

  val run : Ans.t t -> Ans.t
end
