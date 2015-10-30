# testing framework often called "pyunit"

import unittest
from linked_list import *

class TestLinkedList(unittest.TestCase):

    def test_upper(self):
        self.assertEqual('foo'.upper(), "FOO")



if __name__ == '__main__':
    unittest.main(verbosity = 2)
