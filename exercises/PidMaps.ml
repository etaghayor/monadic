(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-20-27-32-33-37-39"]

open Monads.Parser

(* From [http://magnus.therning.org/posts/2007-05-27-289-adventures-in-parsing.html] *)

(** Utility functions *)

(* TODO: very ugly, should probably define the parser on Seq *)
let to_list l = List.of_seq (String.to_seq l)
let hexCharset = to_list "0123456789abcdefgh"
let hex_to_string b = "0x" ^ String.concat "" (List.map Char.escaped b)

let pp_pair s oc (b, e) =
  Printf.fprintf oc ("%s.1 = %s\n" ^^ "%s.2 = %s") s b s e

let pp_perm oc (r, w, x, p) =
  Printf.fprintf oc ("r = %b\n" ^^ "w = %b\n" ^^ "x = %b\n" ^^ "s = %c") r w x p

let[@warning "-32"] pp (addr, perm, offset, device, inode, path) =
  Printf.printf
    ("%a\n" ^^ "%a\n" ^^ "offset = %s\n" ^^ "%a\n" ^^ "inode = %s\n"
   ^^ "path = %s")
    (pp_pair "address") addr pp_perm perm offset (pp_pair "device") device inode
    path

(******************************************************************)

let symbol c = failwith "NYI"
let rec one_of l = failwith "NYI"
let hex_digit () = failwith "NYI"
let%test _ = run (symbol 'c') [ 'c' ] = ()

let%test _ =
  (* XXX: this also fails when NYI *)
  try
    ignore (run (symbol 'c') [ 'd' ]);
    false
  with _ -> true

let%test _ = List.for_all (fun c -> run (hex_digit ()) [ c ] = c) hexCharset

let%test _ =
  (* XXX: this also fails when NYI *)
  try
    ignore (run (hex_digit ()) [ 'A' ]);
    false
  with _ -> true

let rec star m = failwith "NYI"
and plus m = failwith "NYI"

let%test _ = run (plus (symbol 'a')) [ 'a'; 'b' ] = [ () ]
let%test _ = run (plus (symbol 'a')) [ 'a'; 'a'; 'b' ] = [ (); () ]

let%test _ =
  (* XXX: this also fails when NYI *)
  try
    ignore (run (plus (symbol 'a')) [ 'b'; 'a'; 'b' ]);
    false
  with _ -> true

let%test _ = run (star (symbol 'a')) [ 'a'; 'b' ] = [ () ]
let%test _ = run (star (symbol 'a')) [ 'a'; 'a'; 'b' ] = [ (); () ]
let%test _ = run (star (symbol 'a')) [ 'b'; 'a'; 'b' ] = []

let%test _ =
  let ex = [ '0'; '8'; '0'; '5'; '8'; '0'; '0'; '0' ] in
  run (plus (hex_digit ())) ex = ex

let%test _ =
  let ex = [ '0'; '8'; '0'; '5'; 'b'; '0'; '0'; '0' ] in
  run (plus (hex_digit ())) ex = ex

(******************************************************************)

let hex_number () = failwith "NYI"
let%test _ = run (hex_number ()) (to_list "08058000") = "0x08058000"
let%test _ = run (hex_number ()) (to_list "0805b000") = "0x0805b000"
let%test _ = run (hex_number ()) (to_list "0") = "0x0"
let%test _ = run (hex_number ()) (to_list "1") = "0x1"
let%test _ = run (hex_number ()) (to_list "01234567") = "0x01234567"
let%test _ = run (hex_number ()) (to_list "89abcdef") = "0x89abcdef"

let%test _ =
  (* XXX: this also fails when NYI *)
  try
    ignore (run (hex_number ()) (to_list ""));
    false
  with _ -> true

(******************************************************************)

let parse_address () = failwith "NYI"

let%test _ =
  run (parse_address ()) (to_list "08058000-0805b000")
  = ("0x08058000", "0x0805b000")

let%test _ = run (parse_address ()) (to_list "0-1") = ("0x0", "0x1")

let%test _ =
  run (parse_address ()) (to_list "01234567-89abcdef")
  = ("0x01234567", "0x89abcdef")

(******************************************************************)

let parse_perms () = failwith "NYI"
let%test _ = run (parse_perms ()) (to_list "rwxp") = (true, true, true, 'p')
let%test _ = run (parse_perms ()) (to_list "r-xp") = (true, false, true, 'p')
let%test _ = run (parse_perms ()) (to_list "r-xs") = (true, false, true, 's')

(******************************************************************)

let parse_device () = failwith "NYI"
let%test _ = run (parse_device ()) (to_list "03:0c") = ("0x03", "0x0c")

(******************************************************************)

let parse_path () = failwith "NYI"
let%test _ = run (parse_path ()) (to_list " /usr/sbin/gpm") = "/usr/sbin/gpm"

let%test _ =
  run (parse_path ()) (to_list "     /usr/sbin/gpm") = "/usr/sbin/gpm"

(******************************************************************)

let parse_region () = failwith "NYI"

let%test _ =
  run (parse_region ())
    (to_list "08048000-08056000 r-xp 00000000 03:0c 64593      /usr/sbin/gpm")
  = ( ("0x08048000", "0x08056000"),
      (true, false, true, 'p'),
      "0x00000000",
      ("0x03", "0x0c"),
      "0x64593",
      "/usr/sbin/gpm" )

let%test _ =
  run (parse_region ()) (to_list "08058000-0805b000 rwxp 00000000 00:00 0")
  = ( ("0x08058000", "0x0805b000"),
      (true, true, true, 'p'),
      "0x00000000",
      ("0x00", "0x00"),
      "0x0",
      "" )

let%test _ =
  (* XXX: this also fails when NYI *)
  try
    ignore
      (run (parse_region ())
         (to_list "08058000-0805b000 rwxp 00000000 00:00 0 "));
    false
  with _ -> true

let inputs =
  [
    "7fb9155c4000-7fb9155c5000 rw-p 00009000 fe:01 262508                     \
     /lib/x86_64-linux-gnu/librt-2.31.so (deleted)";
    "7fb9155e7000-7fb91563e000 r--p 00000000 fe:01 262607                     \
     /lib/systemd/libsystemd-shared-247.so (deleted)";
    "7fb91563e000-7fb9157ca000 r-xp 00057000 fe:01 262607                     \
     /lib/systemd/libsystemd-shared-247.so (deleted)";
  ]

let%test_unit _ =
  inputs |> List.iter (fun l -> ignore (run (parse_region ()) (to_list l)))
