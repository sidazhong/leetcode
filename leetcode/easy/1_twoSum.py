from typing import List

# 余值映射键
'''
class twoSum:
    def start(self,nums:List[int],target:int)->List[int]:
        pool={}
        for k in range(len(nums)):
            complement=target-nums[k]
            if complement in pool:
                return [k,pool[complement]]
            pool[nums[k]]=k
            
        return [] 
'''
# 双指针
class twoSum:
    def start(self,nums:List[int],target:int)->List[int]:
        l=0
        r=len(nums)-1
        nums.sort()
        while l<=r:
            if(nums[l]+nums[r]==target):
                return [r,l]

            if(nums[r]+nums[l]>target):
                r-=1
            else:
                l+=1

obj=twoSum()
nums = [3,2,4]
target = 6
print(obj.start(nums,target))

