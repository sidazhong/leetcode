class Solution(object):

    # 从中间往两头检查，多一种偶数情况
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        def check (l,r):
            while l>=0 and r<len(s) and s[l]==s[r]:
                if r-l+1 > self.max_count:
                    self.max_str = s[l:r+1]
                    self.max_count = r-l+1
                l-=1
                r+=1

        self.max_count=0
        self.max_str=""
        for k in range(len(s)):
            check(k,k+1)
            check(k,k)
            
        return self.max_str
        
s="abcba"
print(Solution().longestPalindrome(s))