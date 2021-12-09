# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None


'''
# hashtable，每个元素检索
class Solution(object):
    def hasCycle(self, head):

        hashmap=[]
        while head:
            if head in hashmap:
                return True
            hashmap.append(head)
            head=head.next

        return False
'''


# 快慢双指针, 快慢相等为True, 快指针2步None为Flase
class Solution(object):
    def hasCycle(self, head):
        p_slow=head
        p_fast=head

        while (p_fast and p_fast.next):
            p_slow=p_slow.next    
            p_fast=p_fast.next.next
            if(p_fast==p_slow):
                return True

        return False

node1=ListNode(3)
node2=ListNode(2)
node3=ListNode(0)
node4=ListNode(-4)

node1.next=node2.next=node3.next=node4.next=node2
print(Solution().hasCycle(node1))