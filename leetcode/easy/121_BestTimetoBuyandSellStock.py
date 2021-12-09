
from typing import List

'''
# 指针更新最大，目标取大，比较当前值减指针于保持不变
class Solution(object):
    def maxProfit(self, prices)->int:
        p=0
        target=0

        for k in range(len(prices)):
            if(prices[p]>prices[k]):
                p=k
            else:
                target=max(prices[k]-prices[p],target)

        return target
'''

# 双指针，小指针值最小，大指针依据具体条件更新值
class Solution(object):
    def maxProfit(self, prices)->int:
        p_min=0
        p_max=0
        target=0

        for k in range(len(prices)):
            if(prices[k]<prices[p_min]):
                p_min=k

            if(prices[k]-prices[p_min]>target):
                p_max=k
                target=prices[p_max]-prices[p_min]

        return target


prices=[7,1,5,3,6,4]
print(Solution().maxProfit(prices))