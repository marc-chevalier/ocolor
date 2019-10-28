open OUnit

open Ocolor_test_format

let run_tests () =
  let suite =
    "Ocolor" >::: [
      test_format;
    ]
  in
  run_test_tt_main suite

let _ = run_tests ()