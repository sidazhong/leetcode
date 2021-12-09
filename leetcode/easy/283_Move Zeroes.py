class Solution(object):
    # 指针重新排序数组，最后把0补上
    '''
    def moveZeroes(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        index=0
        for k in range(len(nums)):
            if (nums[k]!=0):
                nums[index]=nums[k]
                index+=1
        for k in range(index,len(nums)):
            nums[k]=0

        return nums
    '''

    # 冒泡排序
    def moveZeroes(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        i = 0
        for k in range(len(nums)):
            if nums[k] != 0:
                nums[i], nums[k] = nums[k], nums[i]
                i += 1

        return nums


nums=[0,1,0,3,12,0,3]
#nums=[0,0,0,0,0,1]

print(Solution().moveZeroes(nums))