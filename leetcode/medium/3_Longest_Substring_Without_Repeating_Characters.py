class Solution(object):
    # 滑动窗口 数组 （优先这个）
    '''
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        window = []
        r = 0
        l = 0
        rs = 0
        while r < len(s):
            while s[r] in window:
                window.remove(s[l])
                l+=1

            window.append(s[r])
            rs = max(rs,len(window))
            r+=1
        return rs
    '''

    # 滑动窗口 哈系
    def lengthOfLongestSubstring(self, s):
        window = {}
        r = 0
        l = 0
        rs = 0
        while r < len(s):
            if s[r] in window:
                l= max(window[s[r]],l)  #防止 指针后退，估计考虑不到

            window[s[r]]=r+1    #最少为1, 防止特殊情况，估计考虑不到
            rs = max(rs,r-l+1)
            r+=1

        print("***********")
        return rs

s="abccba"
print(Solution().lengthOfLongestSubstring(s))



