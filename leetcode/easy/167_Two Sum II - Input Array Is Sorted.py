class Solution(object):
    # 双指针，两边往中间
    def twoSum(self, numbers, target):
        """
        :type numbers: List[int]
        :type target: int
        :rtype: List[int]
        """

        l=0
        r=len(numbers)-1

        while l!=r:
            if numbers[l]+numbers[r]==target:
                return [l+1,r+1]
            if numbers[l]+numbers[r]>target:
                r -= 1
            else:
                l += 1

        return []


numbers = [2,7,11,15]
target = 9
print(Solution().twoSum(numbers,target))
