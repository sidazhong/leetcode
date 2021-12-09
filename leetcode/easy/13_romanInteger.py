from typing import List

'''
values = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}

class Solution:
    def romanToInt(self, s: str) -> int:
        total = values.get(s[-1])
        for i in reversed(range(len(s) - 1)):
            if values[s[i]] < values[s[i + 1]]:
                total -= values[s[i]]
            else:
                total += values[s[i]]
        return total


s = "MCMXCIV"
obj = Solution()
rs=obj.romanToInt(s)
print(rs)
'''


values = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}

# 右到左，小-1,大+1
class romaninterger:
    def start(self,s:str)->int:
        s_list=list(s)[::-1]
        rs=values.get(s_list[0])

        for k in range(len(s_list)):
            if(k==(len(s_list)-1)):
                continue
            if(values.get(s_list[k]) <= values.get(s_list[k+1])):
                rs+=values.get(s_list[k+1])
            else:
                rs-=values.get(s_list[k+1])
        return rs

s="MCMXCIV"
obj=romaninterger()
print(obj.start(s))