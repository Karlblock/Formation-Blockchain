pragma solidity ^0.4.24;

library StackLib {
  using StackLib for Stack;

  struct Stack {
    uint[] _items;
  }

  function pushElement(Stack storage self, uint element) internal returns (bool) {
    self._items.push(element);
  }

  function popElement(Stack storage self) internal returns (uint) {
    uint element = self.peek();

    if (self.size() > 0)
      delete self._items[self.size() - 1];

    return element;
  }

  function peek(Stack storage self) internal returns (uint) {
    uint value;

    if (self.size() > 0)
      value = self._items[self.size() - 1];

    return value;
  }

  function size(Stack storage self) internal returns (uint8) {
    return self.size();
  }
}
