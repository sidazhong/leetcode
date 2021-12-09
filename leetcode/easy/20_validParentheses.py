'''
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """

        # The stack to keep track of opening brackets.
        stack = []

        # Hash map for keeping track of mappings. This keeps the code very clean.
        # Also makes adding more types of parenthesis easier
        mapping = {")": "(", "}": "{", "]": "["}

        # For every bracket in the expression.
        for char in s:

            # If the character is an closing bracket
            if char in mapping:

                # Pop the topmost element from the stack, if it is non empty
                # Otherwise assign a dummy value of '#' to the top_element variable
                top_element = stack.pop() if stack else '#'

                # The mapping for the opening bracket in our hash and the top
                # element of the stack don't match, return False
                if mapping[char] != top_element:
                    return False
            else:
                # We have an opening bracket, simply push it onto the stack.
                stack.append(char)

        # In the end, if the stack is empty, then we have a valid expression.
        # The stack won't be empty for cases like ((()
        return not stack


obj = Solution()

s = "([)]"
rs=obj.isValid(s)
print(rs)
'''


# stack，映射字符对，匹配出
class validParentheses:
    def start(self,s:str)->bool:
        hashmap={
            ")":"(",
            "]":"[",
            "}":"{"
        }
        stack=[]
        for v in s:
            if v in hashmap:
                #已经空了
                if not stack:
                    return False
                pop=stack.pop()

                #不匹配
                if hashmap[v]!=pop:
                    return False
            else:
                stack.append(v)
        if stack:
            return False
        else:
            return True

s="[(){}]["
obj=validParentheses()
print(obj.start(s))



'''
class validParentheses:
    def start(self,s:str)->bool:
        while "()" in s or "{}" in s or '[]' in s:
            s = s.replace("{}", "").replace('()', "").replace('[]', "")
        return s == ''
'''