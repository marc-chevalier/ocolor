open OUnit

open Ocolor_format

open Ocolor_test_lib

let _test_format_context : test =
    let test_cases : (string * (Format.formatter -> unit) * string) list = [
      "empty_context", (fun fmt -> Format.fprintf fmt "a@{<red>b@}c"), "a"^ ~>[31]^"b"^ ~>[39]^"c";
    ]
    in
    let test (name, f, standard : string * (Format.formatter -> unit) * string) : test =
      let case () =
        assert_equal
          ~cmp:(fun x y -> String.compare x y = 0)
          ~printer:(fun x -> x)
          ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
          (asprintf "%t" f)
          standard
      in
      name >:: case
    in
    "pair" >::: List.map test test_cases

let test_format_context : test =
  let suite =
    "context" >::: [
      _test_format_context;
    ]
  in
  suite