"use strict";
//https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/get

//handler.get() 
const get_target = {
  message1: "test1",
  message2: "test2"
};

//origin
const get_handler1 = {};
const get_proxy1 = new Proxy(get_target, get_handler1);
console.log(get_proxy1.message1); // test1
console.log(get_proxy1.message2); // test2

//change
const get_handler2 = {
  get: function (get_target, prop, receiver) {
    if (prop === "message2") {
      return "test3";
    }
    return Reflect.get(...arguments);
  },
};
const proxy2 = new Proxy(get_target, get_handler2);
console.log(proxy2.message1); // test1
console.log(proxy2.message2); // test3
//=================================================================

//handler.set()
function Monster() {
  this.eyeCount = 4;
}

const set_handler1 = {
  set(obj, prop, value) {
    if ((prop === 'eyeCount') && (value !== 4)) {
      console.log('Monsters changes its eye numbers: ');
      return Reflect.set(...arguments);
    }
  }
};

const set_monster = new Monster();
const set_proxy1 = new Proxy(set_monster, set_handler1);
console.log(set_proxy1.eyeCount);

//set a new value
set_proxy1.eyeCount = 1;	
console.log(set_proxy1.eyeCount);
//=================================================================

//has
const has_handler = {
  has(target, key) {
  	//trap secreat key
    if (key === '_secret') {
      return false;
    }
    return true;
  }
};

const has_monster = {
  _secret: 'easily scared',
  eyeCount: 4
};

const has_proxy1 = new Proxy(has_monster, has_handler);
console.log('eyeCount' in has_proxy1);	//true

//_secret key is trapped
console.log('_secret' in has_proxy1);	//false
//=================================================================

//deleteProperty
const delete_monster = {
  texture: 'scaly'
};

const delete_handler = {
  deleteProperty(target, prop) {
  	//prop is the key delete
    if (prop in target) {
      delete target[prop];
      console.log(`property removed: ${prop}`);
      return true;
    }
  }
};

console.log(delete_monster.texture);	//scaly

//delete property 
const delete_proxy = new Proxy(delete_monster, delete_handler);
delete delete_proxy.texture;
console.log(delete_monster.texture);	//undefined
//=================================================================

//apply
function sum(a, b) {
  return a + b;
}

const apply_handler = {
  apply: function(target, thisArg, argumentsList) {
    //target () is a passwd function which is this.sum()
    //(argumentsList[0]+argumentsList[1]) * 10
    return target(argumentsList[0], argumentsList[1]) * 10;
  }
};

console.log(sum(1, 2));	//3

//pass a function this.sum()
const apply_proxy = new Proxy(sum, apply_handler);
console.log(apply_proxy(1, 2));	//30
//=================================================================

//construct
function construct_monster(disposition) {
	console.log('no constructor called');
  this.disposition = disposition;
}

const construct_handler = {
  construct(target, args) {
  	//make a constructor 
    console.log('monster1 constructor called, do things here');
    return new target(...args);
  }
};

console.log(new construct_monster('fierce').disposition);	//fierce

const construct_proxy = new Proxy(construct_monster, construct_handler);
console.log(new construct_proxy('fierce').disposition);	//fierce




























































