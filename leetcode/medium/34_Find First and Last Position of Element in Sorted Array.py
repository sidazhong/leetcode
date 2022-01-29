class Solution(object):
    def searchRange(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """

        '''
        rs = [-1,-1]
        def search(p):
            l = 0
            r = len(nums)-1
            while l<=r:
                m = (l+r)//2

                if target==nums[m]:
                    if p:
                        rs[0]=m
                        r = m - 1
                    else:
                        rs[1]=m
                        l = m + 1

                if target<nums[m]:
                    r = m - 1
                if target>nums[m]:
                    l = m + 1
        
        search(True)
        search(False)
        return rs
        '''

        rs = [-1,-1]
        def search(p):
            l = 0
            r = len(nums)-1
            while l<=r:
                m = (l+r)//2
                if target == nums[m]:
                    if p:
                        r = m-1
                        rs[0]=m
                    else:
                        l = m+1
                        rs[1]=m
                else:
                    if target < nums[m]:
                        r = m-1
                    else:
                        l = m+1
        search(True)
        search(False)
        return rs


nums = [5,7,7,8,8,8,10]
target = 8
print(Solution().searchRange(nums,target))