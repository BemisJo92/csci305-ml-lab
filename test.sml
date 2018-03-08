datatype 'a set = Empty | Set of 'a * 'a set;

fun isMember (e, Set(element, otherSet)) =
  if e = element then true
  else if otherSet = Empty then false
  else isMember(e, otherSet);

fun list2Set [] = Empty
  | list2Set (x::xs) = Set(x,(list2Set(xs)));

fun union (Set(element, otherSet), set2) =
  if isMember(element, set2) then union(otherSet, set2)
  else if otherSet = Empty then Set(element, set2)
  else Set(element,union(otherSet, set2));

fun intersect (Set(element, otherSet), set2) =
  if otherSet = Empty andalso isMember(element, set2) then Set(element, Empty)
  else if otherSet = Empty then Empty
  else if isMember(element, set2) then Set(element, intersect(otherSet, set2))
  else intersect(otherSet, set2);

(*Question 5*)
isMember("one", (list2Set(["1", "2", "3", "4"])));

(*Question 7*)
list2Set["it", "was", "the", "best", "of", "times,", "it", "was", "the", "worst", "of", "times"];

(*Question 9*)
val x = list2Set["green", "eggs", "and"];
val y = list2Set["ham"];
union(x,y);

(*Question 10*)
val x = list2Set["stewed", "tomatoes", "and", "macaroni"];
val y = list2Set["macaroni", "and", "cheese"];
intersect(x,y);
