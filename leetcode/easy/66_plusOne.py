from typing import List

class plusOne:
    def start(self,digits:List[int])->List[int]:
        for k in reversed(range(len(digits))):
            if(digits[k]==9):
                digits[k]=0
            else:
                digits[k]+=1
                return digits

        return [1] + digits

digits=[9,9]
obj=plusOne()
print(obj.start(digits))