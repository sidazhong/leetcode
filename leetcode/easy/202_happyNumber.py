
'''
# 拆解数字，hash判断是否为环
class Solution(object):
    def isHappy(self, n):
        hash_set=[]
        while(n!=1):
            sum=0
            for k in map(int, str(n)):
                sum += k**2
            n=sum
            if(n==1):
                return True
            if(n in hash_set):
                return False
            else:
                hash_set.append(n)
        return True
'''

# 拆解数字，快慢指针判断是否为环, 此种环快指针2次跳动与1次结果相同
class Solution(object):
    def isHappy(self, n):
        def get_next(number):
            sum=0
            for k in map(int, str(number)):
                sum += k**2
            return sum

        p_slow=n
        p_fast=n
        while (p_fast!=1):
            p_slow=get_next(p_slow)
            p_fast=get_next(get_next(p_fast))

            if (p_fast==1):
                return True

            if(p_fast==p_slow):
                return False

        return True

n=10
print(Solution().isHappy(n))