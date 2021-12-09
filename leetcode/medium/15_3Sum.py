
# 排序 + 双指针 , 重复的元素省略
class Solution(object):
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        nums.sort()
        rs = []

        for k in range(len(nums)):
            if k>0 and nums[k]==nums[k-1]:
                continue

            l = k+1
            r = len(nums)-1
            while l < r:
                if nums[l]+nums[r]+nums[k]==0:
                    three_sum=[nums[k],nums[l],nums[r]]
                    rs.append(three_sum)
                    l += 1
                    while nums[l]==nums[l-1] and l <r:  # 一直移动左指针
                        l += 1
                elif nums[l]+nums[r]+nums[k]>0:
                    r -= 1
                else:
                    l += 1
        return rs

nums=[0,0,0,0,0,0]
print(Solution().threeSum(nums))