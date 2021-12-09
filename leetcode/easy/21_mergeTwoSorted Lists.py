from typing import List

# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

'''
class Solution:
    def mergeTwoLists(self, l1, l2):
        # maintain an unchanging reference to node ahead of the return node.
        prehead = ListNode(-1)

        prev = prehead
        while l1 and l2:
            if l1.val <= l2.val:
                prev.next = l1
                l1 = l1.next
            else:
                prev.next = l2
                l2 = l2.next            
            prev = prev.next

        # At least one of l1 and l2 can still have nodes at this point, so connect
        # the non-null list to the end of the merged list.
        prev.next = l1 if l1 is not None else l2

        return prehead.next

obj = Solution()

# 1,2,4
# 1,3,4

l1 = ListNode(1,ListNode(2,ListNode(4)))
l2 = ListNode(1,ListNode(3,ListNode(4)))
rs=obj.mergeTwoLists(l1,l2)
print(rs.val)
print(rs.next.val)
print(rs.next.next.val)
print(rs.next.next.next.val)
print(rs.next.next.next.next.val)
print(rs.next.next.next.next.next.val)
'''

# 双指针，小指针前进并保存，补全余数
class mergeTwoSortedLists:
    def start(self,l1,l2):
        head=ListNode(-1)
        
        # 指针并且和head绑定了
        tail=head

        # l1和l2至少一个还有元素
        while l1 and l2:
            if l1.val<=l2.val:
                # tail移动指针到 小的
                tail.next=l1

                # l1往前移动指针
                l1=l1.next
            else:
                tail.next=l2

                # l2往前移动指针
                l2=l2.next
            tail=tail.next

        # 把剩下的一个元素补全
        if l1:
            tail.next=l1
        else:
            tail.next=l2

        return head.next

obj = mergeTwoSortedLists()
l1 = ListNode(1,ListNode(2,ListNode(4)))
l2 = ListNode(1,ListNode(3,ListNode(4)))
rs=obj.start(l1,l2)
print(rs.val)
print(rs.next.val)
print(rs.next.next.val)
print(rs.next.next.next.val)
print(rs.next.next.next.next.val)
print(rs.next.next.next.next.next.val)