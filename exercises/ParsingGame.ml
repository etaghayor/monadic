(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-20-27-32-33-37-39"]

open Monads

(* Taken from [https://wiki.haskell.org/State_Monad#Complete_and_Concrete_Example_1] *)

(* Passes a string of dictionary {a,b,c}
 * Game is to produce a number from the string.
 * By default the game is off, a 'c' toggles the
 * game on and off.
 * A 'a' gives +1 and a 'b' gives -1 when the game is on,
 * nothing otherwise.
 *)

let ( let* ) _ _ = failwith "NYI: bring me in scope!"
let return _ = failwith "NYI: bring me in scope!"
let run _ = failwith "NYI: bring me in scope!"
let play_game _ = failwith "NYI"
let result s = run (play_game s) (false, 0)

let result2 s1 s2 =
  let p =
    let* _ = play_game s1 in
    (* State is kept between [s1] and [s2]! *)
    let* score = play_game s2 in
    return score
  in
  run p (false, 0)

let%test _ = result "ab" = 0
let%test _ = result "ca" = 1
let%test _ = result "cabca" = 0
let%test _ = result "abcaaacbbcabbab" = 2
let%test _ = result2 "ab" "ca" = 1
let%test _ = result2 "ca" "abcaaacbbcabbab" = -1
