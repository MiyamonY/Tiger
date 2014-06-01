(** error message  *)
exception Error;;

let anyErrors = ref false;;
  
let fileName = ref "";;
let lineNum = ref 1;;
let linePos = ref [1];;
let sourceStream = ref stdin;;
  
let reset () =
  filename := "";
  linenum := 1;
  linePos := [1];
  sourceStream := stdin;;

let set_file name =
  fileName := name;
  sourceStream := open_in name;;
  
let incr_linepos () =
  incr lineNum;;

let add_linepos pos =
  linePos := pos :: linePos;;
	  
let error pos msg =
  let rec look pos' n =
	match pos' with
	| [] -> print_string "0.0"
	| (a::rest) ->
	   if a < pos then
		 Printf.printf ":%n.%n" n (pos - a)
	   else look rest n
  in
  anyErrors := true;
  print_string !filename;
  look !linePos !linenum;
  Printf.printf ":%s\n" msg;;

let impossible msg =
  Printf.printf "Error: Compiler bug: %s \n%!" msg;
  raise Error;;
	
