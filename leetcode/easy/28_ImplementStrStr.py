from typing import List

class implementStrStr:
    def start(self,haystack:str,needle:str)->int:
        if not needle:
            return 0

        lh=len(haystack)
        ln=len(needle)

        for k in range(lh-ln+1):
            if(haystack[k:k+ln]==needle):
                return k
        return -1

haystack=""
needle=""
obj=implementStrStr()
print(obj.start(haystack, needle))