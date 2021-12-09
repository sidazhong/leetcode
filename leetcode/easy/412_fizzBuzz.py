from typing import List

'''
class Solution:
    def fizzBuzz(self, n:int)->List[str]:
        # ans list
        ans = []

        # Dictionary to store all fizzbuzz mappings
        fizz_buzz_dict = {3 : "Fizz", 5 : "Buzz"}

        for num in range(1,n+1):

            num_ans_str = ""

            for key in fizz_buzz_dict.keys():

                # If the num is divisible by key,
                # then add the corresponding string mapping to current num_ans_str
                if num % key == 0:
                    num_ans_str += fizz_buzz_dict[key]

            if not num_ans_str:
                num_ans_str = str(num)

            # Append the current answer str to the ans list
            ans.append(num_ans_str)  

        return ans

n = 15
obj = Solution()
rs=obj.fizzBuzz(n)
print(rs)
'''



class fizzBuzz:
    def start(self,n:int)->List[str]:
        pool={3:"Fizz",5:"Buzz"}
        rs=[]
        for k in range(1,n+1):
            tmp_str=""
            for kk in pool.keys():
                if k%kk==0:
                    tmp_str+=pool[kk]
            if not tmp_str:
                tmp_str=str(k)
            rs.append(tmp_str)
        return rs

n = 15
obj=fizzBuzz()
rs=obj.start(n)
print(rs)


