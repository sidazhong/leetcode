var main = {
    name : "main object",
    child : {
        name : "child object"
    },
    init : function() {
        this.child.parent = this;
        delete this.init;
        return this;
    }
}.init();

console.log(main.child.parent.name);
