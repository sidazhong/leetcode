# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution(object):
    # 双指针，左0, 右n
    def removeNthFromEnd(self, head, n):
        """
        :type head: ListNode
        :type n: int
        :rtype: ListNode
        """

        rs = ListNode(0,head)
        l = rs
        r = head

        while n:
            r=r.next
            n-=1 

        while r:
            l=l.next
            r=r.next
        
        l.next=l.next.next
        return rs.next
        


head = ListNode(1,ListNode(2,ListNode(3,ListNode(4,ListNode(5)))))
n = 2

rs=Solution().removeNthFromEnd(head,n)
print(rs.val)
print(rs.next.val)
print(rs.next.next.val)
print(rs.next.next.next.val)
