class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class LinkedList:
    def __init__(self, input_list):
        if not input_list:
            self.head = None
            return

        if isinstance(input_list, ListNode):
            self.head = input_list
            return

        self.head = ListNode(input_list[0])
        current = self.head
        for i in input_list[1:]:
            current.next = ListNode(i)
            current = current.next

    def to_array(self):
        x = []
        current = self.head
        while current:
            x.append(current.val)
            current = current.next
        return x

    def __repr__(self):
        result = self.to_array()
        return "->".join(str(x) for x in result)
