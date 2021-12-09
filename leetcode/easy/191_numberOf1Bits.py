
#32bit 循环 (n>>k) & 1 循环获取n每个bit
#右shift相当于 指针往左
class Solution(object):
    def hammingWeight(self, n):
        """
        :type n: int
        :rtype: int
        """
        count=0
        for k in range(32):
            bit=(n>>k) & 1
            if(bit==1):
                count+=1

        return count

print(Solution().hammingWeight(n))