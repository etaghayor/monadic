module type Monad = sig
  type 'a t

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
end

module type FullMonad = sig
  type 'a t

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t

  (* Subject to the following laws:

     - Left identity:   `bind (return a) f = f a`
     - Right identity: 	`bind m return     = m`
     - Associativity: 	`bind (bind m f) g = bind m (fun x -> bind (f x) g)`
  *)

  (* Alternative namings: *)
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t (* à la Haskell *)
  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t (* à la ML *)

  (* Categorical presentation: *)
  val join : 'a t t -> 'a t
end

module Expand : functor (M : Monad) -> FullMonad with type 'a t = 'a M.t
