# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution(object):
    #双指针, 左None，右1
    def reverseList(self, head):

        l = None
        r = head
        while r:
            tmp = r.next
            r.next = l
            l = r
            r = tmp 

        return l
    '''
     #先递归到最底
    def reverseList(self, head):
        if not head or not head.next:
            return head

        rs = self.reverseList(head.next)
        head.next.next=head
        head.next=None

        return rs
    '''



head=ListNode(1,ListNode(2,ListNode(3,ListNode(4,ListNode(5)))))
rs=Solution().reverseList(head)

print(rs.val)
print(rs.next.val)
print(rs.next.next.val)
print(rs.next.next.next.val)
print(rs.next.next.next.next.val)

        