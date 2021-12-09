from typing import List

# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
'''
# 中左右归 中进 空出
class Solution(object):
    def preorderTraversal(self, root)->List[int]:
        rs=[]
        self.dfs(root,rs)
        return rs

    def dfs(self,root,rs):
        if(root==None):
            return []
        rs.append(root.val)
        self.dfs(root.left, rs)
        self.dfs(root.right, rs)
'''

# stack 一路向左 储存
# 向右出
# 正排
class Solution(object):
    def preorderTraversal(self, root)->List[int]:
        rs=[]
        stack=[]
        while root or stack:
            if root:
                rs.append(root.val)
                stack.append(root)
                root = root.left
            else:
                root = stack.pop().right
        return rs

obj=Solution()
root=TreeNode(1,None,TreeNode(2,TreeNode(3,None,None),None))
print(obj.preorderTraversal(root))