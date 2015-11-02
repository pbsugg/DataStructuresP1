

class Node:

    def new(self, element):
        self.value = element
        self.next_element = None

    # insert other_node after current instance.  current node points to other node
    def insert(self, other_node):
        self.next_element = other_node

    # remove node that current instance points to. removing from the chain
    def remove_after(self):
        self.next_element = None


class LinkedList:

    # create new linked list
    def new(self):
        self.head = None

    # insert element at the front of the list
    # assign value to element
    # point to first element in list
    def insert_first(self, element):
        item = Node()
        item.new(element)
        item.insert(self.head)
        self.head = item

        # remove element at the front of the list, None if empty
    def remove_first(self):
        if self.head == None:
            return "Nothing to remove"
        else:
            old_head = self.head  #assign current head to variable
            self.head = self.head.next_element   #change head to next_element
            old_head.remove_after()  # remove pointer from current head to new head


    #
    #     # insert at end of the list
    # def insert_last(element):
    #
    #     # remove at back, None if empty
    # def remove_last(element):
    #
        # get item at index place in list
    # def get(index):
    #
    #     # Set element in list at index
    # def set(index, element):
    #
    #     return size
    # def size(self):




# __private = private method
