# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution(object):
    #左右交换，递归
    '''
    def invertTree(self, root):
        if root:
            root.left,root.right=root.right,root.left
            self.invertTree(root.left)
            self.invertTree(root.right)
        return root
    '''

    # 先进先出，交换节点，放入节点
    def invertTree(self, root):
        if not root:
            return root

        queue=[]
        queue.append(root)
        while queue:
            currentNode=queue.pop()
            print(currentNode.val)
            currentNode.left,currentNode.right=currentNode.right,currentNode.left
            if  currentNode.left:
                queue.append(currentNode.left)
            if  currentNode.right:
                queue.append(currentNode.right)

        return root
        
root=TreeNode(4,TreeNode(2,TreeNode(1),TreeNode(3)),TreeNode(7,TreeNode(6),TreeNode(9)))
rs=Solution().invertTree(root)

print(rs.val)
print(rs.left.val)
print(rs.right.val)
print(rs.left.left.val)
print(rs.left.right.val)
print(rs.right.left.val)
print(rs.right.right.val)