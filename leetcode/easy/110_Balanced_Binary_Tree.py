# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution(object):

    # 返回[True,Height] 结构
    def isBalanced(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        def dfs(root):
            if not root: return [True,0]

            left = dfs(root.left)
            right = dfs(root.right)

            balance = left[0] and right [0] and abs(left[1]-right[1])<=1
            height = 1+max(left[1],right[1])

            return [balance,height]
        
        return dfs(root)[0]



root=TreeNode(3,TreeNode(9),TreeNode(20,TreeNode(15),TreeNode(7)))
#root=TreeNode(1,TreeNode(2,TreeNode(3,TreeNode(4),TreeNode(4)),TreeNode(3)),TreeNode(2))
#root=TreeNode(1,None,TreeNode(2,None,TreeNode(3)))
#root=TreeNode(1)
#root=TreeNode(1,TreeNode(2,TreeNode(4,TreeNode(8)),TreeNode(5)),TreeNode(3,TreeNode(6),None))


print(Solution().isBalanced(root))
        