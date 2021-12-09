# Definition for a binary tree node.
import collections
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution(object):
    def findMode(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        pool=[root]
        hashmap = {}
        while pool:
            node=pool.pop()
            if node.left:
                pool.append(node.left)
            if node.right:
                pool.append(node.right)
            
            if node.val or node.val==0:
                hashmap[node.val] = hashmap.get(node.val, 0) + 1

        if not hashmap:
            return [0]

        rs=[]
        maxval=max(hashmap.values())
        for k,v in hashmap.items():
            if v == maxval:
                rs.append(k)

        return rs
        
root=TreeNode(
    1,
    TreeNode(0,TreeNode(1),TreeNode(0)),
    TreeNode(0,TreeNode(1),TreeNode(1,TreeNode(0))))


print(Solution().findMode(root))