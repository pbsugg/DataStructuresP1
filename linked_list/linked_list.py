

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
        item = self.__create_node(element)
        item.insert(self.head)
        self.head = item

        # remove element at the front of the list, None if empty
    def remove_first(self):
        if self.head == None:
            return "Nothing to remove"
        else:
            old_head = self.head  #assign current head to variable
            self.head = self.head.next_element   #change head to next_element
            old_head.remove_after()  # move pointer from current head to new head

    # insert at end of the list
    def insert_last(self, element):
        # create node
        item_to_insert = self.__create_node(element)
        current_end_node = self.__traverse_to_node_end(self.head)
        current_end_node.next_element = item_to_insert

        # remove at back, None if empty
    def remove_last(self):
        current_node = self.head
        while (current_node.next_element != None):
            prev_node = current_node
            current_node = current_node.next_element
        prev_node.next_element = None

        # get item at index place in list
        # there's no natural index, have to come up with a counter
    def get(self, index):
        counter = 0
        current_node = self.head
        while counter != index:
            current_node = current_node.next_element
            counter += 1
        return current_node
    #
    #     # Set element in list at index
    def set(self, index, element):
        counter = 0
        current_node = self.head
        while counter != index:
            current_node = current_node.next_element
            counter += 1
        current_node.value = element
        return current_node

    def size(self):
        counter = 1
        current_node = self.head
        while current_node.next_element != None:
            current_node = current_node.next_element
            counter += 1
        return counter

    def __create_node(self, element):
        item = Node()
        item.new(element)
        return item

    def __traverse_to_node_end(self, current_node):
        while (current_node.next_element != None):
            current_node = current_node.next_element
        return current_node


# __private = private method
