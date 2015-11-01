

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

#
# class LinkedList:
#
#     # not sure if I need this
#     def __init__(self):
#
#     # create new linked list
#     def new(self):
#
#     # insert element at the front of the list
#     def insert_first(element):
#
#         # remove element at the front of the list, None if empty
#     def remove_first(self):
#
#         # insert at end of the list
#     def insert_last(element):
#
#         # remove at back, None if empty
#     def remove_last(element):
#
#         # get item at index place in list
#     def get(index):
#
#         # Set element in list at index
#     def set(index, element):
#
#         return size
#     def size(self):


# __private = private method
