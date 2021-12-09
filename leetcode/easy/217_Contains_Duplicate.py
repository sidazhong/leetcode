# 哈系，排序
class Solution(object):
    '''
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        hashset=[]
        for k in range(len(nums)):
            if(nums[k] in hashset):
                return True
            hashset.append(nums[k])
        
        return False
    '''

    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        nums.sort()
        for k in range(1,len(nums)):
            if(nums[k]==nums[k-1]):
                return True
        return False
        

nums=[1,2,3,1]
print(Solution().containsDuplicate(nums))