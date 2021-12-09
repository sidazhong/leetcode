# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

# 所谓删除就是 把删除的node的下一个node变成自己
class Solution(object):
    def deleteNode(self, node, delete):
        """
        :type node: ListNode
        :rtype: void Do not return anything, modify node in-place instead.
        """

        if(node.next):
            node.val = node.next.val
            node.next = node.next.next
        return node

node1=ListNode(4)
node2=ListNode(5)
node3=ListNode(1)
node4=ListNode(9)

node1.next=node2
node2.next=node3
node3.next=node4

rs=Solution().deleteNode(node1,node2)
print(rs.val)
print(rs.next.val)
print(rs.next.next.val)