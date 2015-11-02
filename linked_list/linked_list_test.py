# testing framework often called "pyunit"

import unittest
from linked_list import *

class TestNode(unittest.TestCase):

    def setUp(self):
        self.a = Node()
        self.b = Node()

    def test_new(self):
        self.a.new("Sample Value")
        self.assertEqual(self.a.value, "Sample Value")

    def test_insert(self):
        self.a.insert(self.b)
        self.assertEqual(self.a.next_element, self.b)

    def test_remove_after(self):
        self.a.remove_after()
        self.assertEqual(self.a.next_element, None)


class TestLinkedList(unittest.TestCase):

    def setUp(self):
        self.list = LinkedList()
        self.list.new()

        # code smell: chaining all these methods together here
    def test_insert_first(self):
        self.list.insert_first("Test")
        self.assertEqual(self.list.head.value, "Test")

    def test_remove_first(self):
        self.list.insert_first("Three")
        self.list.insert_first("Two")
        self.list.insert_first("One")
        self.list.remove_first()
        self.assertEqual(self.list.head.value, "Two")
        self.list.remove_first()
        self.assertEqual(self.list.head.value, "Three")

    def test_insert_last(self):
        self.list.insert_first("One")
        self.list.insert_last("Two")
        self.assertEqual(self.list.head.next_element.value, "Two")

    def test_remove_last(self):
        self.list.insert_first("Two")
        self.list.insert_first("One")
        self.list.remove_last()
        self.assertEqual(self.list.head.next_element, None)

    def test_set(self):
        self.list.insert_first("Two")
        self.list.insert_first("One")
        self.list.set(0, "Reset")
        self.assertEqual(self.list.head.value, "Reset")
        self.list.set(1, "Reset")
        self.assertEqual(self.list.head.next_element.value, "Reset")

    def test_size(self):
        self.list.insert_first("Three")
        self.list.insert_first("Two")
        self.list.insert_first("One")
        self.assertEqual(self.list.size(), 3)





if __name__ == '__main__':
    unittest.main(verbosity = 2)
