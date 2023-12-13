module type Monoid = sig
  type t

  val empty : t
  val ( <+> ) : t -> t -> t
end

module type MonoidAction = sig
  type m
  type t

  val act : t -> m -> t
end
