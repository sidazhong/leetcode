class Logger(object):
    def __init__(self):
        self.hashmap={}

    def shouldPrintMessage(self, timestamp, message):
        """
        :type timestamp: int
        :type message: str
        :rtype: bool
        """
        if not timestamp and not message:
            return None

        if message not in self.hashmap.keys():
            self.hashmap[message]=timestamp
            return True
        else:
            if (timestamp-self.hashmap[message]) >= 10:
                self.hashmap[message]=timestamp
                return True
            else:
                return False
        


# Your Logger object will be instantiated and called as such:
obj = Logger()

print(obj.shouldPrintMessage(None,None))
print(obj.shouldPrintMessage(1,"foo"))
print(obj.shouldPrintMessage(2,"bar"))
print(obj.shouldPrintMessage(3,"foo"))
print(obj.shouldPrintMessage(8,"bar"))
print(obj.shouldPrintMessage(10,"foo"))
print(obj.shouldPrintMessage(11,"foo"))
print(obj.shouldPrintMessage(100,"bug"))
print(obj.shouldPrintMessage(100,"bug"))

