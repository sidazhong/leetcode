from typing import List

# 字符反排
class reverseInteger:
    '''
    def start(self,x:int)->int:
        rs=0
        if x>=0:
            rs=int(str(x)[::-1])
        else:
            tmp1=str(x)[1:]
            rs=0-int(tmp1[::-1])

        if(rs>=2**31 or rs<= -2**31):
            rs=0

        return rs
    '''
    # 正常做，
    # 检查最倒数第二位，如果相等，检查最后一位
    # python bug
    # -1 % 10 = 0     ** -1
    # -1 //10 = -1    ** -10

    def start(self,x:int)->int:

        max_last_digit = 2**31%10
        max_second_digit = 2**31//10

        min_last_digit = 0-(2**31)%10
        min_second_digit =  0-(2**31)//10

        rs=0
        while x:
            digit=abs(x)%10 if x>0 else 0-abs(x)%10
            x=abs(x)//10 if x>0 else 0-abs(x)//10

            if(rs>max_second_digit or (rs==max_second_digit and digit>max_last_digit)):
                return 0

            if(rs<min_second_digit or (rs==min_second_digit and digit<min_last_digit)):
                return 0

            rs = 10 * rs + digit 
        return rs 

x=-2147483412
obj=reverseInteger()
print(obj.start(x))