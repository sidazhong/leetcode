class Solution(object):
    
    # key和value都加起来比较
    '''
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        sum1=0
        sum2=0
        for k in range(len(nums)+1):
            sum1+=k
            if(k<len(nums)):
                sum2+=nums[k]

        return sum1-sum2
    '''
    # hash比较
    '''
    def missingNumber(self, nums):
        for k in range(len(nums)+1):
            if (k not in nums):
                return k
    '''
    # 排序
    def missingNumber(self, nums):
        nums.sort()
        for k in range(len(nums)+1):
            if(k<len(nums) and k!=nums[k]):
                return k

        return len(nums)

        
nums = [9,6,4,2,3,5,7,0,1]
nums = [0,1]
print(Solution().missingNumber(nums))