class climbingStairs:
    def start(self,n:int)->int:
        rs=[0] * (n+10)
        rs[1]=1
        rs[2]=2
        for k in range(3,n+1):
            rs[k]=rs[k-1]+rs[k-2]

        return rs[n]



obj=climbingStairs()
n=5
print(obj.start(n))

