
# 映射表加减排除
class Solution(object):
    def singleNumber(self, nums):

        hashmap={}
        for k in range(len(nums)):
            if nums[k] in hashmap:
                del hashmap[nums[k]]
            else:
                hashmap[nums[k]]=k
        return hashmap.popitem()[0]
        
nums=[4,1,2,1,2]
print(Solution().singleNumber(nums))

