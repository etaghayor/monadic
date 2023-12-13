(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-37-39"]

open Monads

(* Taken from http://learnyouahaskell.com/for-a-few-monads-more *)

let rec gcdaux a b = failwith "NYI"
let gcd a b = failwith "replace me with: 'run (gcdaux a b)'"

let%test _ =
  let x, r = gcd 100 24 in
  r = 4 && x = [ "100 mod 24 = 4"; "24 mod 4 = 0"; "Finished with 4" ]

let%test _ =
  let x, r = gcd 8 3 in
  r = 1
  && x = [ "8 mod 3 = 2"; "3 mod 2 = 1"; "2 mod 1 = 0"; "Finished with 1" ]

let fib x =
  let rec aux x acc1 acc2 =
    if x = 0 then acc2 else aux (x - 1) acc2 (acc1 + acc2)
  in
  aux x 1 0

let%test _ =
  (* https://stackoverflow.com/questions/3980416/time-complexity-of-euclids-algorithm *)
  let x, r = gcd (fib 101) (fib 100) in
  r = 1
  && x
     = [
         "1298777728820984005 mod 3736710778780434371 = 1298777728820984005";
         "3736710778780434371 mod 1298777728820984005 = 1139155321138466361";
         "1298777728820984005 mod 1139155321138466361 = 159622407682517644";
         "1139155321138466361 mod 159622407682517644 = 21798467360842853";
         "159622407682517644 mod 21798467360842853 = 7033136156617673";
         "21798467360842853 mod 7033136156617673 = 699058890989834";
         "7033136156617673 mod 699058890989834 = 42547246719333";
         "699058890989834 mod 42547246719333 = 18302943480506";
         "42547246719333 mod 18302943480506 = 5941359758321";
         "18302943480506 mod 5941359758321 = 478864205543";
         "5941359758321 mod 478864205543 = 194989291805";
         "478864205543 mod 194989291805 = 88885621933";
         "194989291805 mod 88885621933 = 17218047939";
         "88885621933 mod 17218047939 = 2795382238";
         "17218047939 mod 2795382238 = 445754511";
         "2795382238 mod 445754511 = 120855172";
         "445754511 mod 120855172 = 83188995";
         "120855172 mod 83188995 = 37666177";
         "83188995 mod 37666177 = 7856641";
         "37666177 mod 7856641 = 6239613";
         "7856641 mod 6239613 = 1617028";
         "6239613 mod 1617028 = 1388529";
         "1617028 mod 1388529 = 228499";
         "1388529 mod 228499 = 17535";
         "228499 mod 17535 = 544";
         "17535 mod 544 = 127";
         "544 mod 127 = 36";
         "127 mod 36 = 19";
         "36 mod 19 = 17";
         "19 mod 17 = 2";
         "17 mod 2 = 1";
         "2 mod 1 = 0";
         "Finished with 1";
       ]
