# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


#临时储存node, List赋值会同步！         
class Solution(object):
    def reverseList(self, head):
        '''
        previous=None
        current=head

        while current:
            tmp=current.next
            current.next=previous
            previous=current
            current=tmp
        return previous
        '''
        rs=None
        while head:
            next=head.next

            prev=rs
            rs=head
            rs.next=prev

            head=next

        return rs

#先递归到最底，
class Solution(object):
    def reverseList(self, head):
        if not head or not head.next:
            return head

        rs = self.reverseList(head.next)

        print(head.val)

        head.next.next=head
        head.next=None

        return rs



head=ListNode(1,ListNode(2,ListNode(3,ListNode(4,ListNode(5)))))
rs=Solution().reverseList(head)

'''
print(rs.val)
print(rs.next.val)
print(rs.next.next.val)
print(rs.next.next.next.val)
print(rs.next.next.next.next.val)

'''

        