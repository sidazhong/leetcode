'use strict';

const fs = require('fs');
const opcodes = require('./op-codes.js').opcodes;

/**
 * GLEAM is the Gas-Limited EVM-like virtuAl Machine.
 */
class GleamVirtualMachine {

  constructor() {
    this.stack = [];
    this.memory = [];
    this.labels = {};
  }

  /** 
   * Loads a bytecode file and returns an array of strings,
   * which are the commands within the file.
   */
  static loadBytecode(bytecodeFile) {
    let contents = fs.readFileSync(bytecodeFile, 'utf8');
    let lines = contents.trim().split('\n');
    return lines.map((ln) => ln.replace(/\s*#.*/, ''));
  }

  /**
   * Evaluates the specified file, throwing an exception
   * if the gasLimit is exceeded.
   * 
   * YOUR JOB: Update the code to track gas usage and throw
   * the "Out of Gas" exception.
   */
  evaluate(bytecodeFile, gasLimit) {
    this.bytecode = this.constructor.loadBytecode(bytecodeFile);

    // Initializing the program counter to keep track of our
    // place within the program.
    this.pc = 0;
    let use_gasPrice=0;
    while (this.pc<this.bytecode.length) {
      let ln = this.bytecode[this.pc];
      if (ln.endsWith(":")) {
        // If the current line is a label,
        // we store it so that we can jump to this point later.
        this.labels[ln.replace(/:/, '')] = this.pc;
      } else {
        let [opcode, ...args] = ln.split(/\s+/);
        let op = opcodes[opcode];
        
        //Update the code to track gas usage
        use_gasPrice += op.gasPrice;
        
        //throw the "Out of Gas" exception.
        if (use_gasPrice > gasLimit)
          throw "Out of Gas";
        
        let val = op.evaluate(args, this);

        // Check for an early return;
        if (val !== undefined) return val;
      }

      // Incrementing ther program counter to process the next line.
      this.pc++;
    }
  }
}


exports.GleamVirtualMachine = GleamVirtualMachine;
