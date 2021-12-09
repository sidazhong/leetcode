# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


# 中造树 左右两头归 左比右大出
class Solution(object):
    def sortedArrayToBST(self, nums):
        if not nums:
            return None

        tree=self.buildTree(nums,0,len(nums)-1)
        return tree

    def buildTree(self,nums,left,right):
        if(left>right):
            return None

        mid=(left+right)//2
        tree=TreeNode(nums[mid])
        tree.left=self.buildTree(nums,left,mid-1)
        tree.right=self.buildTree(nums,mid+1,right)

        return tree

nums = [-10,-3,0,5,9]
rs=Solution().sortedArrayToBST(nums)

print(rs.val)
print(rs.left.val)
print(rs.right.val)
print(rs.right.right.val)
print(rs.left.right.val)