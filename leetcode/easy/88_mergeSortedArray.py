'''
from typing import List
class mergeSortedArray:
    def start(self,nums1:List[int],m:int,nums2:List[int],n:int):
        for k in range(n):
            nums1[k+m]=nums2[k]
        nums1.sort()
        print(nums1)

obj=mergeSortedArray()
nums1 = [1,2,3,0,0,0] 
m = 3
nums2 = [2,5,6]
n = 3
obj.start(nums1, m, nums2, n)
'''

'''
from typing import List
class mergeSortedArray:
    def start(self,nums1:List[int],m:int,nums2:List[int],n:int):
        nums1_copy=nums1[:m]
        p1=0
        p2=0
        for p in range(m+n):
            #p2>=n or  
            if(p2>=n or (p1<m and nums1_copy[p1]<=nums2[p2])  ):
                nums1[p]=nums1_copy[p1]
                p1+=1
            else:
                nums1[p]=nums2[p2]
                p2+=1

        print(nums1)


obj=mergeSortedArray()
nums1 = [1,2,3,0,0,0] 
m = 3
nums2 = [2,5,6]
n = 3
obj.start(nums1, m, nums2, n)
'''

from typing import List
class mergeSortedArray:
    def start(self,nums1:List[int],m:int,nums2:List[int],n:int):
        p1=m-1
        p2=n-1

        for p in reversed(range(m+n)):
            if(p2<0):
                break

            if(p1<0 or nums1[p1]<nums2[p2]):
                nums1[p]=nums2[p2]
                p2-=1
            else:
                nums1[p]=nums1[p1]
                p1-=1

        print(nums1)

obj=mergeSortedArray()
'''
nums1 = [1,2,3,0,0,0] 
m = 3
nums2 = [2,5,6]
n = 3
'''
nums1=[2,0]
m=1
nums2=[1]
n=1

obj.start(nums1, m, nums2, n)