module type Monad = sig
  type 'a t

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
end

module type FullMonad = sig
  type 'a t

  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t

  (* Alternative namings: *)
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t (* à la Haskell *)
  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t (* à la ML *)

  (* Categorical presentation: *)
  val join : 'a t t -> 'a t
end

module Expand (M : Monad) = struct
  include M

  (* À la Haskell *)
  let ( >>= ) = M.bind

  (* À la ML *)
  let ( let* ) = M.bind

  (* Categorical presentation *)
  let join mmx = M.bind mmx (fun mx -> mx)
end
