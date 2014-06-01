(* 演習問題1.1 *)
module Tree = struct
  type key = string;;

  type tree = 
	| Leaf
	| Tree of tree * key * tree;;

  let empty = Leaf;;

  let rec insert (key, t) =
	match t with
	| Leaf -> Tree(Leaf, key, Leaf)
	| Tree(l, k, r) ->
	   if key < k then
		 Tree(insert(key, l), k, r)
	   else if key > k then
		 Tree(l, k, insert(key, r))
	   else t;;

  (* a. *)
  let rec member key = function
	| Leaf -> false
	| Tree(l, k, r) ->
	   if key < k then member key l
	   else if key > k then member key r
	   else true;;
end;;
  
(* b. *)
module PolyTree = struct
  type key = string;;
	
  type 'a tree =
	| Leaf
	| Tree of 'a tree * (key * 'a) * 'a tree;;

  let rec insert (t, key, a) =
	match t with
	| Leaf -> Tree(Leaf, (key, a), Leaf)
	| Tree(l, ((k, _) as p), r) ->
	   if k < key then Tree(insert (l, key, a), p, r)
	   else if k > key then Tree(l, p, insert (r, key ,a))
	   else t;;
	
  let rec lookup (t, key) =
	match t with
	| Leaf -> None
	| Tree(l, (k, a), r) ->
	   if k < key then lookup (l, key)
	   else if k > key then lookup (r, key)
	   else a;;
end;;

(* c. (a) *)
open Tree;;

let tree_a =
  List.fold_right (fun k t -> insert (k,t))
				  ["t"; "s"; "p"; "i"; "p"; "f"; "b"; "s"; "t"] empty;;

let tree_b =
  List.fold_right (fun k t -> insert (k,t))
				  ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"] empty;;
  
(* d *)
(* 後で *)
