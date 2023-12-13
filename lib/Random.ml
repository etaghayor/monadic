open Monad

module type ProbMonad = sig
  (* See also https://github.com/coq-community/alea *)

  include FullMonad

  val rand : int -> int t
  val choose : float -> 'a t -> 'a t -> 'a t
end

module MonteCarlo = struct
  module Base = struct
    type 'a t = int -> 'a * int

    let return a s = (a, s)
    let bind m f s = match m s with x, s -> f x s
  end

  module M = Monad.Expand (Base)
  include M

  let next_state s = (s * 25173) + 1725
  let rand n s = (abs s mod n, next_state s)

  let choose p a b s =
    if float (abs s) <= p *. float max_int then a (next_state s)
    else b (next_state s)

  let run m = fst (m 42)
end

module Distribution = struct
  module Base = struct
    type 'a t = ('a * float) list

    let return a = [ (a, 1.0) ]

    (* TODO: this creates denormalized representations *)
    let bind m f =
      List.concat
        (m
        |> List.map (fun (x, p1) ->
               f x |> List.map (fun (y, p2) -> (y, p1 *. p2))))
  end

  module M = Expand (Base)
  include M

  let rec enum n = if n <= 0 then [] else (n - 1) :: enum (n - 1)

  let rand n =
    let freq = 1. /. float_of_int n in
    List.map (fun k -> (k, freq)) (enum n)

  let choose p a b =
    (a |> List.map (fun (x, p1) -> (x, p *. p1)))
    @ (b |> List.map (fun (y, p2) -> (y, (1.0 -. p) *. p2)))

  let rec norm = function [] -> [] | xp :: l -> insert xp (norm l)

  and insert (x, p) = function
    | [] -> [ (x, p) ]
    | ((x', p') as xp') :: l ->
        if x < x' then (x, p) :: xp' :: l
        else if x = x' then (x, p +. p') :: l
        else xp' :: insert (x, p) l

  let run m = norm m
end

module Expectation = struct
  module Base = struct
    type 'a t = ('a -> float) -> float

    let return a k = k a
    let bind m f k = m (fun vx -> f vx k)
  end

  module M = Expand (Base)
  include M

  let rec enum n = if n <= 0 then [] else (n - 1) :: enum (n - 1)

  let rand n =
    let freq = 1. /. float_of_int n in
    fun k -> List.fold_left ( +. ) 0. (List.map (fun v -> freq *. k v) (enum n))

  let choose p a b k = (p *. a k) +. ((1. -. p) *. b k)
  let run m = m
end
