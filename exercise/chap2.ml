(* 2.1 *)
(* a. *)
let re = Str.regexp "c*a.*\\|c*";;

  List.map (fun (str,a) ->
			if (Str.string_match re str 0) then
			  (Str.matched_string str = str) = a
		   else a = false)
			(*(try 
			  if Str.string_match re str 0 then
				if (Str.matched_string str) == str then
				  true
				else false
			  else false
			with Not_found -> false) == a)*)
			 [("a", true); ("b", false); ("c", true);
			  ("aa", true);("ab", true); ("ac", true);
			  ("ba", false); ("bb", false); ("bc", false);
			  ("ca", true); ("cb", false); ("cc", true);
			  ("aaa", true); ("aab", true); ("aac", true);
			  ("aba", true); ("abb", true); ("abc", true);
			  ("aca", true); ("acb", true); ("acc", true);
			  ("baa", false); ("bab", false); ("bac", false);
			  ("bba", false); ("bbb", false); ("bbc", false);
			  ("bca", false); ("bcb", false); ("bcc", false);
			  ("caa", true); ("cab", true); ("cac", true);
			  ("cba", false); ("cbb", false); ("cbc", false);
			  ("cca", true); ("ccb", false); ("ccc", true);];;
  
(* b. *)
let r2 = Str.regexp "\\(a[b\\|c]*a\\)*[b\\|c]*";;
[bc]*(a[bc]*a)*  
let test_fun = (fun s -> Str.string_match r2 s 0) in
	List.map (fun (s,a) -> test_fun s = a)
			 [("a", false); ("b", true); ("c", true);
			  ("aa", true);("ab", false); ("ac", false);
			  ("ba", false); ("bb", true); ("bc", true);
			  ("ca", false); ("cb", true); ("cc", true);
			  ("aaa", false); ("aab", true); ("aac", true);
			  ("aba", true); ("abb", false); ("abc", false);
			  ("aca", true); ("acb", false); ("acc", false);
			  ("baa", true); ("bab", false); ("bac", false);
			  ("bba", false); ("bbb", true); ("bbc", true);
			  ("bca", false); ("bcb", true); ("bcc", true);
			  ("caa", true); ("cab", false); ("cac", false);
			  ("cba", false); ("cbb", true); ("cbc", true);
			  ("cca", false); ("ccb", true); ("ccc", true);];;
  
let test = (Str.string_match r2 "cca" 0) = false;;
(Str.string_match r2 "cca" 0);;

  c. [01]*00
			c. 1[01]*(1[01]{4} | 011[01]{2} | |0101[01]
(* e. *)
let re = Str.regexp "0\\(a*\\([bc]*\\|bc|ca+\\)*\\)\\1";;

let match_re = Str.regexp "baa";;

type 'a lazy_list =
  | Nil
  | Cons of 'a * 'a lazy_list Lazy.t;;
  
let rec lazy_map f = function
  | Nil -> Nil
  | Cons (a, tl) -> Cons (f a, lazy (lazy_map f (Lazy.force_val tl)));;
  
let rec lazy_app la lb =
  match la with
  | Nil -> lb
  | Cons (a, tl) -> Cons (a, lazy (lazy_app (Lazy.force_val tl)
											lb));;
let gen_str n = 
  let rec gen_str_aux = function
  | 0 -> Cons ("1", lazy Nil)
  | n ->
	 let strl = gen_str_aux (pred n) in
	 lazy_app (lazy_app (lazy_map (fun s -> "a" ^ s) strl)
						(lazy_map (fun s -> "b" ^ s) strl))
			  (lazy_map (fun s -> "c" ^ s) strl) in
  lazy_map ((^) "0") (gen_str_aux n);;
  
let rec lazy_all f = function
  | Nil -> true
  | Cons (a, tl) ->
	 if f a then lazy_all f (Lazy.force_val tl)
	 else false;;
  
let test_fun = (fun s -> Str.string_match re s 0) in
	let eq_list = lazy_map
					(fun s -> test_fun s = not (Str.string_match match_re s 0))
											   (gen_str 10) in
	lazy_all ((=) true) eq_list;;
				
						  
