from typing import List

# 打包循环，判断相等
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        prefix=''
        for x in zip(*strs):    #x      ('f', 'f', 'f')     ('o','o','i')
            if len(set(x))==1:  #set(x) {'f'}               {'o','i'}
                prefix+=x[0]
            else:
                break
        return prefix


strs=["flower","flow","flight"]
#strs=["ab", "a"]
obj = Solution()
rs=obj.longestCommonPrefix(strs)
print(rs)