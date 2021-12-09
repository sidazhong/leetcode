from typing import List

# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

'''
# 左右中归 中进 空出
class Solution(object):
    def postorderTraversal(self, root)->List[int]:
        rs=[]
        self.dfs(root,rs)
        return rs

    def dfs(self,root,rs):
        if(root==None):
            return []
        self.dfs(root.left, rs)
        self.dfs(root.right, rs)
        rs.append(root.val)
'''

# stack 一路向右储存
# 向左出
# 反排
class Solution(object):
    def postorderTraversal(self, root)->List[int]:
        stack=[]
        rs=[]
        while root or stack:
            if root:
                rs.append(root.val)
                stack.append(root)
                root = root.right
            else:
                root = stack.pop().left
        return rs[::-1]

obj=Solution()
root=TreeNode(1,None,TreeNode(2,TreeNode(3,None,None),None))
print(obj.postorderTraversal(root))