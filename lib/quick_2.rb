def sort(to_sort, index_of_pivot = 0, right_index = to_sort.length - 1)
       old_right_index = right_index
       left_index = index_of_pivot

       # stop the recursion if nothing to sort
       if left_index >= right_index then
           return to_sort
       end

       # partition operation
       # move both indexes towards the center until they cross over
       # when left index finds an element greater than pivot and
       # right index finds an element smaller than pivot swap them
       while left_index < right_index
           while to_sort[left_index] <= to_sort[index_of_pivot] and left_index < to_sort.length - 1
               left_index = left_index + 1
           end

           right_index = right_index - 1 until to_sort[right_index] <= to_sort[index_of_pivot]

           # swap both elements
           if left_index < right_index
               to_sort[left_index], to_sort[right_index] = to_sort[right_index], to_sort[left_index]
           end
       end

       # swap pivot
       to_sort[index_of_pivot], to_sort[right_index] = to_sort[right_index], to_sort[index_of_pivot]

       # recursively sort the sub arrays
       sort(to_sort, index_of_pivot, right_index - 1)
       sort(to_sort, left_index, old_right_index)

       return to_sort
   end
