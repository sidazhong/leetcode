# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        '''
        head=tail=ListNode(0)
        carry=0
        while l1 or l2 or carry:
            l1_val=l1.val if l1 else 0
            l2_val=l2.val if l2 else 0

            val=carry+l1_val+l2_val
            carry=val//10
            val=val%10

            tail.next=ListNode(val) 
            tail=tail.next

            l1=l1.next if l1 else None
            l2=l2.next if l2 else None

        return head.next
        '''

        head=tail=ListNode(0)
        while l1 or l2:
            l1_val=l1.val if l1 else 0
            l2_val=l2.val if l2 else 0

            val=tail.val+l1_val+l2_val
            tail.val=val%10

            l1=l1.next if l1 else None
            l2=l2.next if l2 else None

            carry=val//10
            tail.next=ListNode(carry) if l1 or l2 or carry else None    # 如果都没值，且没有carry就停止
            tail=tail.next
        return head
        
l1 = ListNode(1,ListNode(5,ListNode(1)))
l2 = ListNode(1,ListNode(1,ListNode(1)))
rs = Solution().addTwoNumbers(l1,l2)

print(rs.val)
print(rs.next.val)
print(rs.next.next.val)
print(rs.next.next.next.val)