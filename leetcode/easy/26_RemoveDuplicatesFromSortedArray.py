from typing import List

'''
class Solution(object):
    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
'''


class removeDuplicatesFromSortedArray:
    def start(self,nums:List[int])->int:
        insertIndex=1

        for k in range(1,len(nums)):
            if nums[k]!=nums[insertIndex-1]:
                nums[insertIndex]=nums[k]
                insertIndex+=1

        return insertIndex

obj=removeDuplicatesFromSortedArray()
#nums=[0,0,1,1,1,2,2,3,3,4]
nums=[1,1]
rs=obj.start(nums)
print(rs)