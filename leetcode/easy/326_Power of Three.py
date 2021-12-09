
# while 遍历
class Solution(object):
    def isPowerOfThree(self, n):
        """
        :type n: int
        :rtype: bool
        """
        if (n==0):
            return false

        while n%3==0:
            n/=3

        return n==1

n = 27
print(Solution().isPowerOfThree(n))