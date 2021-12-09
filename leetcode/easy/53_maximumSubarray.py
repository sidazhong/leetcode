from typing import List

class maximumSubarray:
    def start(self,nums:List[int])->int:
        currentv=nums[0]
        maxv=nums[0]
        for k in range(1,len(nums)):
            currentv=max((nums[k]+currentv),nums[k])
            if(currentv>=maxv):
                maxv=currentv

        return maxv


nums=[5,4,-1,7,8]
obj=maximumSubarray()
print(obj.start(nums))