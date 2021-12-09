# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


# 一路左，一路右，比较最大+1出
'''
class Solution(object):
    def maxDepth(self, root):
        if(not root):
            return 0

        left=self.maxDepth(root.left)
        right=self.maxDepth(root.right)
        return max(left,right)+1
'''


# queue，全出，2进，深+1
class Solution(object):
    def maxDepth(self, root):
        if(not root):
            return 0

        queue=[root]
        depth=0

        while queue:
            for k in range(len(queue)):
                pop=queue.pop(0)
                left=pop.left
                right=pop.right
                if(left):
                    queue.append(left)
                if(right):
                    queue.append(right)
            depth+=1

        return depth



obj=Solution()
root=TreeNode(1,
        TreeNode(2,
            TreeNode(3),
            TreeNode(4)),
        TreeNode(2,
            TreeNode(4),
            TreeNode(3)))

print(obj.maxDepth(root))