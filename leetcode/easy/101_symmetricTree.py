class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

'''
#3出口 4比较
class Solution(object):
    def isSymmetric(self, root):
        if(not root):
            return True
        
        return self.compair(root.left,root.right)

    def compair(self,left,right):
        # 空相同
        if(not left and not right):
            return True

        # 空不同
        if(not left or not right):
            return False

        # 值相同
        if(left.val!=right.val):
            return False

        # 左左 右右 和 左右 右左
        return self.compair(left.left, right.right) and self.compair(left.right, right.left)
'''



#[1,1]
#[2,2,N,N]
#[3,3,4,4,N,N]

# stack 2出，4进，比较值和空
'''
class Solution(object):
    def isSymmetric(self, root):
        if(not root):
            return True
        
        stack=[root,root]
        while stack:
            left=stack.pop()
            right=stack.pop()

            # 空继续
            if(not left and not right):
                continue

            # 空不同
            if(not left or not right):
                return False

            # 值不同
            if(left.val!=right.val):
                return False

            stack.append(left.left)
            stack.append(right.right)
            stack.append(left.right)
            stack.append(right.left)

        return True
        '''

class Solution(object):
    def isSymmetric(self, root):
        pool = [(root.left,root.right)]
        while pool:
            (p,q) = pool.pop()
            if p and q and p.val==q.val:
                pool.extend([(p.left,q.right),(p.right,q.left)])
            elif p or q:
                return False
        return True


obj=Solution()
root=TreeNode(1,
        TreeNode(2,
            TreeNode(3),
            TreeNode(4)),
        TreeNode(2,
            TreeNode(4),
            TreeNode(3)))

print(obj.isSymmetric(root))