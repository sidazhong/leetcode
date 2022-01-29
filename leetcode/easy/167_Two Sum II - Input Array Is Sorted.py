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
        rs = []
        while l<r:
            if numbers[l]+numbers[r]==target:
                r -= 1
                l += 1
                if r != l:
                    rs.append([l+1,r+1])
            elif numbers[l]+numbers[r]>target:
                r -= 1
            else:
                l += 1

        return rs


numbers = [1,2,3,4,5,6,7,8,9]
target = 8
print(Solution().twoSum(numbers,target))

