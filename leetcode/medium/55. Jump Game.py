class Solution(object):
    def canJump(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        # 反着跳
        r = len(nums)-1
        for l in reversed(range(len(nums))):
            if l+nums[l]>=r:
                r=l
        return r==0
        
nums = [2,3,1,1,4]
print(Solution().canJump(nums))