# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

# set，每个元素检索
'''
class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        hashset=set()
        while headB:
            hashset.add(headB)
            headB=headB.next

        while headA:
            if(headA in hashset):
                return headA

            headA=headA.next

        return None
'''

# 双指针，跑到底互换，相同出
class Solution(object):
    def getIntersectionNode(self, headA, headB):
        p1=headA
        p2=headB

        while p1 != p2:
            p1=headB if not p1 else p1.next
            p2=headA if not p2 else p2.next

        return p1

        

node_a1=ListNode(4)
node_a2=ListNode(1)

node_c1=ListNode(8)
node_c2=ListNode(4)
node_c3=ListNode(5)

node_b1=ListNode(5)
node_b2=ListNode(6)
node_b3=ListNode(1)

node_a1.next=node_a2

node_a2.next=node_c1
node_c1.next=node_c2
node_c2.next=node_c3
node_b3.next=node_c1

node_b1.next=node_b2
node_b2.next=node_b3

print(Solution().getIntersectionNode(node_a1, node_b1).val)