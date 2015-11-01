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


if __name__ == '__main__':
    unittest.main(verbosity = 2)
