'''
# tuple push比较上一个与当前，存最小
class MinStack(object):

    def __init__(self):
        self.stack=[]


    def push(self, val):
        if(not self.stack):
            item=(val,val)
        else:
            item=(val,min(val,self.stack[-1][1]))
        self.stack.append(item)

    def pop(self):
        return self.stack.pop()
        

    def top(self):
        return self.stack[-1][0]
        

    def getMin(self):
        return self.stack[-1][1]
'''

'''
# 双stack，另一个存放最小值，pop也要一起出
class MinStack(object):
    def __init__(self):
        self.stack=[]
        self.minStack=[]

    def push(self, val):
        if(not self.stack):
            self.minStack.append(val)

        if(val<=self.minStack[-1]):
            self.minStack.append(val)
            
        self.stack.append(val)

    def pop(self):
        pop=self.stack.pop()
        if(pop==self.minStack[-1]):
            self.minStack.pop()

    def top(self):
        return self.stack[-1]
        
    def getMin(self):
        return self.minStack[-1]
'''

# 3stack，另一个stack在用stack计数最小值
class MinStack(object):
    def __init__(self):
        self.stack=[]
        self.minStack=[]

    def push(self, val):
        if(not self.stack):
            self.minStack.append([val,1])

        if(val==self.minStack[-1][0]):
            self.minStack[-1][1]+=1

        if(val<self.minStack[-1][0]):
            self.minStack.append([val,1])
            
        self.stack.append(val)

    def pop(self):
        pop=self.stack.pop()
        if(pop==self.minStack[-1][0]):
            if(self.minStack[-1][1]==1):
                self.minStack.pop()
            else:
                self.minStack[-1][1]-=1

    def top(self):
        return self.stack[-1]
        
    def getMin(self):
        return self.minStack[-1][0]

# Your MinStack object will be instantiated and called as such:
obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
param_4 = obj.getMin()
obj.pop()
param_3 = obj.top()
param_4 = obj.getMin()