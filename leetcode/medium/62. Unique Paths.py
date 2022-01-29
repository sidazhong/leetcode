class Solution(object):
    def uniquePaths(self, m, n):
        """
        m=3 n=7
        28 21 15 10 06 03 01
        07 06 05 04 03 "02" 01
        01 01 01 01 01 01 01

        最下面为1
        然后倒着每一行反向 右侧+下侧数字 

        :type m: int
        :type n: int
        :rtype: int
        """
        bottom_row = [1] * n
        for c in range(m-1):
            top_row=[1] * n
            for r in reversed(range(n-1)):
                top_row[r]=top_row[r+1]+bottom_row[r]
            bottom_row = top_row
        return bottom_row[0]

        


m = 3
n = 7
print(Solution().uniquePaths(m,n))