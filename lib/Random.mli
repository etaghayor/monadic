open Monad

module type ProbMonad = sig
  include FullMonad

  (* [rand n] returns a uniformly-distributed integer in [0, n[ *)
  val rand : int -> int t

  (* [choose p] evaluates either a with probability p ∈ [0, 1] or b with probability 1 − p *)
  val choose : float -> 'a t -> 'a t -> 'a t
end

module MonteCarlo : sig
  include ProbMonad

  val run : 'a t -> 'a
end

module Distribution : sig
  include ProbMonad

  val run : 'a t -> ('a * float) list
end

module Expectation : sig
  include ProbMonad

  val run : 'a t -> ('a -> float) -> float
end
