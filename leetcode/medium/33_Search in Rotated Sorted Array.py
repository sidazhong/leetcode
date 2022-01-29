class Solution(object):
    # 二分法搜索, 一定有一边是排序好的!
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """

        '''
        l = 0
        r = len(nums)-1
        while l<=r:
            m = (l + r)//2
            
            if target==nums[m]:
                return m
            
            if nums[l]<=nums[m]:
                if target<nums[m] and target>=nums[l]:
                    r = m - 1
                else:
                    l = m + 1
            else:
                if nums[m]<target and target<=nums[r]:
                    l = m + 1
                else:
                    r = m - 1
        
        return -1
        '''
        '''
        l = 0
        r = len(nums)-1
        rs = -1
        while l<=r:
            m = (l+r)//2

            if target < nums[m]:
                r = m-1
            elif nums[m] < target:
                l = m+1
            else:
                return m

        return rs
        '''
        l = 0
        r = len(nums)-1
        while l<=r:
            m = (l+r)//2
            
            if nums[l]<=nums[m]:
                if target == nums[m]:
                    return m
                else:
                    if target < nums[m] and target >= nums[l]:
                        r = m-1
                    else:
                        l = m+1
            else:
                if target == nums[m]:
                    return m
                else:
                    if target > nums[m] and target <= nums[r]:
                        l = m+1
                    else:
                        r = m-1
        return -1

        
nums = [4,5,6,7,0,1,2]
#nums = [0,1,2,4,5,6,7]
target = 0

print(Solution().search(nums,target))



