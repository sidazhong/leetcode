from typing import List

# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
        
'''
# 左中右归 中进 空出
class Solution(object):
    def inorderTraversal(self, root)->List[int]:
        rs=[]
        self.dfs(root, rs)
        return rs

    def dfs(self,root,rs):
        if root==None:
            return []
        self.dfs(root.left,rs)
        rs.append(root.val)
        self.dfs(root.right,rs)
'''

# stack 一路向左
# 向右出 储存
# 正排
class Solution(object):
    def inorderTraversal(self, root)->List[int]:
        rs=[]
        stack=[]
        while root or stack:
            if root:
                stack.append(root)
                root=root.left
            else:
                pop=stack.pop()
                root=pop.right
                rs.append(pop.val)

        return rs

obj=Solution()
root=TreeNode(1,None,TreeNode(2,TreeNode(3,None,None),None))
print(obj.inorderTraversal(root))
