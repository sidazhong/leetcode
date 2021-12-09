
# 格式化，找中位数，stack进出，检查空
'''
class Solution(object):
    def isPalindrome(self, s):
        s=s.lower()
        rs=""
        for k in s:
            if k.isalnum():
                rs+=k

        pool=[]
        p=len(rs)//2

        if(len(rs)%2!=0):
            rs = rs[:p] + rs[p+1:]

        for k in range(len(rs)):
            if(k<p):
                pool.append(rs[k])

            if(k>=p):
                pop=pool.pop()
                if(pop!=rs[k]):
                    return False

        return not pool
'''

# 双指针前后比较
class Solution(object):
    def isPalindrome(self, s):
        p1=0
        p2=len(s)-1

        while p1<=p2:
            if(not s[p1].isalnum()):
                p1+=1
                continue
                
            if(not s[p2].isalnum()):
                p2-=1
                continue

            if s[p1].lower() != s[p2].lower():
                return False

            p1+=1
            p2-=1

        return True


        
s="A man, a plan, a canal: Panama"
s="abccba"
print(Solution().isPalindrome(s))