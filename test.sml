datatype 'a set = Empty | Set of 'a * 'a set;

(* fun isMember(Empty) = false
  | isMember(e, Node(element, recurse)) =
    if e = element then true
    else isMember(e, recurse); *)


fun isMember (e, Set(element, otherSet)) =
  if e = element then true
  else if otherSet = Empty then false
  else isMember(e, otherSet);

(*Not finished yet. Not sure what's wrong.*)
fun list2Set [] = Empty
  | list2Set (x::xs) = Set(x,(list2Set(xs)));

list2Set [1,2,3];
list2Set [#"a", #"b", #"c"];
isMember(1, Set(1, Set(2, Set(3, Empty))));
