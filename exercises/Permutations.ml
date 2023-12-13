(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-20-27-32-33-37-39"]

open Monads.Nondeterminism

let rec insert x l = failwith "NYI"
let rec permut l = failwith "NYI"
let%test _ = List.of_seq (all (permut [])) = [ [] ]
let%test _ = List.of_seq (all (permut [ 1 ])) = [ [ 1 ] ]

let%test _ =
  List.sort compare (List.of_seq (all (permut [ 1; 2 ])))
  = [ [ 1; 2 ]; [ 2; 1 ] ]

let%test _ =
  List.sort compare (List.of_seq (all (permut [ 1; 2; 3 ])))
  = [
      [ 1; 2; 3 ];
      [ 1; 3; 2 ];
      [ 2; 1; 3 ];
      [ 2; 3; 1 ];
      [ 3; 1; 2 ];
      [ 3; 2; 1 ];
    ]
