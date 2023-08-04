open OUnit

open Ocolor_types
open Ocolor_format

open Ocolor_test_lib


let _test_format_pp_bool : test =
  let test_cases : (string * (Format.formatter -> bool -> unit) * string * string) list = [
    "empty_generic", pp_bool_generic ~false_style:[] ~true_style:[], "false", "true";
    "false_bold", pp_bool_generic ~false_style:[Bold] ~true_style:[], ~>[1]^"false"^ ~>[0], "true";
    "true_bold", pp_bool_generic ~false_style:[] ~true_style:[Bold], "false", ~>[1]^"true"^ ~>[0];
    "default", pp_bool, ~~>[[1]; [31]]^"false"^ ~~>[[0;31]; [39]], ~~>[[1]; [32]]^"true"^ ~~>[[0;32]; [39]];
  ]
  in
  let test (name, f, false_string, true_string : string * (Format.formatter -> bool -> unit) * string * string) : test list =
    let false_case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f false)
        false_string
    in
    let true_case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f true)
        true_string
    in
    [name^"_true" >:: true_case; name^"_false" >:: false_case]
  in
  "bool" >::: List.concat (List.map test test_cases)

let _test_format_pp_option : test =
  let test_cases : (string * (Format.formatter -> int option -> unit) * string * string) list = [
    "empty_generic", pp_option_generic ~none:"" ~none_style:[] ~some_style:[] Format.pp_print_int, "", "42";
    "default_none", pp_option_generic ~none_style:[] ~some_style:[] Format.pp_print_int, "None", "42";
    "bold_none", pp_option_generic ~none:"" ~none_style:[Bold] ~some_style:[] Format.pp_print_int, ~~>[[1]; [0]], "42";
    "bold_some", pp_option_generic ~none:"" ~none_style:[] ~some_style:[Bold] Format.pp_print_int, "", ~>[1]^"42"^ ~>[0];
    "default", pp_option Format.pp_print_int, ~>[2]^"None"^ ~>[0], "42";
    "default_empty_printer", pp_option (fun _ _ -> ()),  ~>[2]^"None"^ ~>[0], "";
    "red_some_empty_printer", pp_option_generic ~some_style:[Fg (C4 red)] (fun _ _ -> ()), ~>[2]^"None"^ ~>[0], ~~>[[31]; [39]];
    "default_sneaky_printer", pp_option (fun fmt _ -> Format.pp_print_string fmt "gotcha"), ~>[2]^"None"^ ~>[0], "gotcha";
  ]
  in
  let test (name, f, false_string, true_string : string * (Format.formatter -> int option -> unit) * string * string) : test list =
    let none_case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f None)
        false_string
    in
    let some_case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f (Some 42))
        true_string
    in
    [name^"_none" >:: none_case; name^"_some" >:: some_case]
  in
  "option" >::: List.concat (List.map test test_cases)

let _test_format_pp_pair : test =
  let test_cases : (string * (Format.formatter -> int * string -> unit) * string) list = [
    "empty_generic", pp_pair_generic ~left:"" ~right:"" ~sep:"" ~delim_style:[] ~sep_style:[] ~elem_style:[] Format.pp_print_int Format.pp_print_string, "42foo";
    "default_no_style", pp_pair_generic ~delim_style:[] ~sep_style:[] ~elem_style:[] Format.pp_print_int Format.pp_print_string, "(42, foo)";
    "default", pp_pair Format.pp_print_int Format.pp_print_string, ~>[2]^"("^ ~>[0]^"42"^ ~>[2]^", "^ ~>[0]^"foo"^ ~>[2]^")"^ ~>[0];
    "strange_delimiters", pp_pair_generic ~left:"bar" ~right:"#" ~sep:".." ~delim_style:[] ~sep_style:[] ~elem_style:[] Format.pp_print_int Format.pp_print_string, "bar42..foo#";
  ]
  in
  let test (name, f, standard : string * (Format.formatter -> int * string -> unit) * string) : test =
    let case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f (42, "foo"))
        standard
    in
    name >:: case
  in
  "pair" >::: List.map test test_cases

let _test_format_pp_3_tuple : test =
  let test_cases : (string * (Format.formatter -> int * string * bool -> unit) * string) list = [
    "default_no_style", pp_3_tuple_generic ~delim_style:[] ~sep_style:[] ~elem_style:[] Format.pp_print_int Format.pp_print_string Format.pp_print_bool, "(42, foo, true)";
  ]
  in
  let test (name, f, standard : string * (Format.formatter -> int * string * bool -> unit) * string) : test =
    let case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f (42, "foo", true))
        standard
    in
    name >:: case
  in
  "3_tuple" >::: List.map test test_cases

let _test_format_pp_4_tuple : test =
  let test_cases : (string * (Format.formatter -> int * string * bool * float -> unit) * string) list = [
    "default_no_style", pp_4_tuple_generic ~delim_style:[] ~sep_style:[] ~elem_style:[] Format.pp_print_int Format.pp_print_string Format.pp_print_bool Format.pp_print_float, "(42, foo, true, 3.14)";
  ]
  in
  let test (name, f, standard : string * (Format.formatter -> int * string * bool * float -> unit) * string) : test =
    let case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f (42, "foo", true, 3.14))
        standard
    in
    name >:: case
  in
  "4_tuple" >::: List.map test test_cases

let _test_format_pp_5_tuple : test =
  let test_cases : (string * (Format.formatter -> int * string * bool * float * char -> unit) * string) list = [
    "default_no_style", pp_5_tuple_generic ~delim_style:[] ~sep_style:[] ~elem_style:[] Format.pp_print_int Format.pp_print_string Format.pp_print_bool Format.pp_print_float Format.pp_print_char, "(42, foo, true, 3.14, m)";
  ]
  in
  let test (name, f, standard : string * (Format.formatter -> int * string * bool * float * char -> unit) * string) : test =
    let case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f (42, "foo", true, 3.14, 'm'))
        standard
    in
    name >:: case
  in
  "5_tuple" >::: List.map test test_cases

let _test_format_pp_iterable : test =
  let module StringSet = Set.Make(String) in
  let test_cases : (string * (Format.formatter -> StringSet.t -> unit) * string list * string) list = [
    "no_style", pp_iterable_generic ~delim_style:[] ~sep_style:[] ~elem_style:[] StringSet.iter Format.pp_print_string, ["foo"; "bar"; "baz"], "[bar; baz; foo]";
    "no_style_empty_without_empty", pp_iterable_generic ~delim_style:[] ~sep_style:[] ~elem_style:[] StringSet.iter Format.pp_print_string, [], "[]";
    "no_style_empty_with_empty", pp_iterable_generic ~empty:"<empty>" ~delim_style:[] ~sep_style:[] ~elem_style:[] StringSet.iter Format.pp_print_string, [], "<empty>";
  ]
  in
  let test (name, f, set, standard : string * (Format.formatter -> StringSet.t -> unit) * string list * string) : test =
    let case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f (StringSet.of_list set))
        standard
    in
    name >:: case
  in
  "iterable" >::: List.map test test_cases

let _test_format_pp_iterable_mapping : test =
  let module StringMap = Map.Make(String) in
  let test_cases : (string * (Format.formatter -> int StringMap.t -> unit) * (string * int) list * string) list = [
    "no_style",
    pp_iterable_mapping_generic ~delim_style:[] ~sep_style:[] ~mapsto_style:[] ~key_style:[] ~value_style:[] StringMap.iter Format.pp_print_string Format.pp_print_int,
    ["foo", 1; "bar", 2; "baz", 3],
    "{bar:2; baz:3; foo:1}";
    "no_style_empty_without_empty",
    pp_iterable_mapping_generic ~delim_style:[] ~sep_style:[] ~mapsto_style:[] ~key_style:[] ~value_style:[] StringMap.iter Format.pp_print_string Format.pp_print_int,
    [],
    "{}";
    "no_style_empty_with_empty",
    pp_iterable_mapping_generic ~empty:"<empty>" ~delim_style:[] ~sep_style:[] ~mapsto_style:[] ~key_style:[] ~value_style:[] StringMap.iter Format.pp_print_string Format.pp_print_int,
    [],
    "<empty>";
  ]
  in
  let test (name, f, map, standard : string * (Format.formatter -> int StringMap.t -> unit) * (string * int) list * string) : test =
    let case () =
      assert_equal
        ~cmp:(fun x y -> String.compare x y = 0)
        ~printer:(fun x -> x)
        ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
        (asprintf "%a" f (List.fold_left (fun acc (k, v) -> StringMap.add k v acc) StringMap.empty map))
        standard
    in
    name >:: case
  in
  "iterable" >::: List.map test test_cases

let test_format_pp : test =
  let suite =
    "pretty_printers" >::: [
      _test_format_pp_bool;
      _test_format_pp_option;
      _test_format_pp_pair;
      _test_format_pp_3_tuple;
      _test_format_pp_4_tuple;
      _test_format_pp_5_tuple;
      _test_format_pp_iterable;
      _test_format_pp_iterable_mapping;
    ]
  in
  suite
