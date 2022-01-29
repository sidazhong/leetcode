class Solution(object):
    # 倒着走, 第N步=n-1 + n-2
    def climbStairs(self, n):
        rs = [1]*(n+1)
        rs[0]=1
        rs[1]=2 
        for k in range(2,n):
            rs[k]=rs[k-1]+rs[k-2]
        return rs[n-1]

n = 5
print(Solution().climbStairs(n))