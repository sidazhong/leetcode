

# 32bit (n>>k) & 1 循环获取n每个bit
# 1往左shift 31位，可以得到一个值， | rs就可以赋值
class Solution:
    # @param n, an integer
    # @return an integer
    def reverseBits(self, n):
        rs=0
        
        for k in range(32):
            bit = (n>>k) & 1
            rs = rs | (bit<<31-k)

        return rs
        

n=43261596
print(Solution().reverseBits(n))