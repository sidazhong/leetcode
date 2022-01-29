class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
#reverse List，在循环比较。  或者直接变成array，比较array [::-1]
'''
class Solution(object):
    def isPalindrome(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        check=[]
        rs=None
        while head:
            check.append(head.val)
            next=head.next
            tmp=rs
            rs=head
            rs.next=tmp
            head=next
        count=0
        while rs:
            if(rs.val!=check[count]):
                return False

            rs=rs.next
            count+=1
        return True

class Solution(object):
    def isPalindrome(self, head):
        rs = []
        while head:
            rs.append(head.val)
            head = head.next
        return rs == rs[::-1]
'''

# 快慢指针切一半，把另一半反转，判断两个是否相同, 有一半可能为不平均，所以left right not None
class Solution(object):
    def isPalindrome(self, head):
        def halfList(head):
            fast=head
            slow=head
            while fast.next and fast.next.next:
                fast=fast.next.next
                slow=slow.next
            return slow

        def reverseList(head):
            rs=None
            while head:
                next=head.next

                tmp=rs
                rs=head
                rs.next=tmp

                head=next
            return rs

        left=head
        right=reverseList(halfList(head))

        while right and left:
            if left.val != right.val:
                return False

            left=left.next
            right=right.next
        return True


head=ListNode(1,ListNode(2,ListNode(3,ListNode(2,ListNode(1)))))
#head=ListNode(1,ListNode(2,ListNode(2,ListNode(1))))
rs=Solution().isPalindrome(head)
print(rs)


head=ListNode(2,ListNode(0,ListNode(-4,ListNode(2))))