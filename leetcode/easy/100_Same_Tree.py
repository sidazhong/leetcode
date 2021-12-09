# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution(object):

    # 递归找出口
    '''
    def isSameTree(self, p, q):
        """
        :type p: TreeNode
        :type q: TreeNode
        :rtype: bool
        """    
        if not p and not q:
            return True

        if not p or not q:
            return False
        
        if p.val != q.val:
            return False
        
        return self.isSameTree(p.left, q.left) and self.isSameTree(p.right, q.right)
        '''

    # pool 每次pop，按条件加入，
    def isSameTree(self, p, q):
        pool = [(p,q)]
        while pool:
            (p,q)=pool.pop()
            if p and p and q.val==p.val:
                pool.extend([(p.left,q.left),(p.right,q.right)])
            elif q or p:
                return False

        return True


p = TreeNode(1,TreeNode(2),TreeNode(3))
q = TreeNode(1,TreeNode(2),TreeNode(3))

print(Solution().isSameTree(p,q))

