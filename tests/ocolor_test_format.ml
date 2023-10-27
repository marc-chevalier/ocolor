open OUnit

open Ocolor_test_format_context
open Ocolor_test_format_pp
open Ocolor_test_tags


let test_format : test =
  let suite =
    "format" >::: [
      test_format_context;
      test_format_pp;
      test_tags;
    ]
  in
  suite