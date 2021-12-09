class Solution(object):
    '''
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        for k in range(len(nums)):
            if(nums[k]==target):
                return k
            
            if(nums[k]>target):
                return k

        return len(nums)
    '''
    # 二分法   1 2 3 4 5 6 
    def searchInsert(self, nums, target):
        left=0
        right=len(nums)-1

        while left <= right:
            pivot = (left+right)//2

            if(nums[pivot]==target):
                return pivot
            if(nums[pivot]<target):
                left = pivot+1
            if(nums[pivot]>target):
                right = pivot-1

        return left


nums = [1,3,5,6]
target = 2
print(Solution().searchInsert(nums,target))