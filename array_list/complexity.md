Determine the complexity of all these array_list operations

1) new_array(size)

O(1), will always take same time to create a new array, just allocating space

2) add(element)

O(N)-- in a worst case scenario, create one really big array and there is one space left, have to look all the way to the end to find a space to add

Under more realistic conditions, since I'm only looking to the last array, it's whatever the size of the underlying fixed array is.

3) get(index)

Think O(N) (at worst), depends on two conditions:
  The number of underlying fixe arrays
  The size of each fixed array

Again, worst case scenario, if I have one really huge fixed array, then I have to go through the whole thing, but under more normal conditions I am doing more than than counting each element in the overall array or counting through each element in the final array

4)  set(index)-- see above

5) same

6) insert(index, element)

  O(N)--worst case I insert at the beginning, best case I am inserting at the end
