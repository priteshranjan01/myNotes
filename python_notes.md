# python 2.7 

- [Top 10 common mistakes](https://www.toptal.com/python/top-10-mistakes-that-python-programmers-make)
- [Good python questions](https://www.toptal.com/python#hiring-guide)
- **REMEMBER**: `/` is integer division in 2.7.  In 3.5. `/` float division and  `//` is integer division.
- `from __future__ import division`
- `raw_input()`  **NOTE**: `raw_input` is not available in 3.5.1 (or 3.X)
- `input()`  -> Equivalent to `eval(raw_input(prompt))`
- `divmod(x, y)` -> (quotient, remainder)
- `pow(x, y[, z])` -> number _ With two arguments, equivalent to `x**y`.  With three arguments, equivalent to `(x**y) % z`, but may be more efficient (e.g. for longs). _
- `range(start, stop[, step])` -> _ list of integers _ in python 2.7
- `range(start, stop[, step])` -> _ range object _ python 3.5
- `xrange(start, stop[, step])` -> _ xrange object _ similar to range in 3.5  **NOTE**: xrange doesn't exist in 3.5. So avoid using it.
- `getattr(object, name[, default])` [Stackoverflow What is getattr?](http://stackoverflow.com/questions/4075190/what-is-getattr-exactly-and-how-do-i-use-it)

- `join(list [,sep])` -> string  **NOTE** `string.join` method in string module is no more. Instead use `'seperator'.join(iterable)` -> string

- [Stackoverflow : Python difference between eval and exec](http://stackoverflow.com/questions/2220699/whats-the-difference-between-eval-exec-and-compile-in-python)
- `hash(object)` -> integer  _ Two objects with the same value have the same hash value.  The reverse is not necessarily true, but likely. eg `hash(1) == hash(1.0)` _

- `myset.add(...)`  Will take only hashable object
- `myset.update(...)`  Will take only iterable objects
- `myset.remove(...)`   If the element is not a member, raise a `KeyError`
- `myset.discard(...)`  If the element is not a member, do nothing.
- `myset.union`, `intersection`, `difference`, `symmetric_difference`
- `myset.update`, `myset.intersection_update`, `myset.difference_update`, `myset.symmetric_difference_update`
- `set >= otherSet` To check for superset

- [Stackoverflow: Sort a list by multiple attributes?](http://stackoverflow.com/questions/4233476/sort-a-list-by-multiple-attributes)

- `''.ljust()`, `''.rjust()`, `''.center()`
- `'BANANA FRIES 12'.rpartition(' ')`  --> `('BANANA FRIES', ' ', '12')`
- `'BANANA FRIES 12'.rsplit(sep=' ', maxsplit=1)`  --> `['BANANA FRIES', '12']`
- `print "{:.2f}".format(4.00001)`  Go through this [PyFormat Using % and .format() for great good!](https://pyformat.info/)
```
 import textwrap
 textwrap.fill()
 textwrap.wrap()
```
- `print ("{0:o}, {0:X}, {0:b}, {0:d}".format(34))` # output: `42, 22, 100010, 34` # prints 34 in octal, hex, binary, and decimal 

- builtins => `chr`, `ord`  # do help(chr) 

- **NOTE**: `'Hello   World  Lol'.split(' ')` vs `'Hello   World  Lol'.split()` # there is a difference, the first one creates extra blank elements also from the spaces between words

- `itertools.product` # Cartesian product of input iterables.  Equivalent to nested for-loops.
- `itertools.permutations`  # permutations([1,2,3], 2) --> (0,1), (0,2), (1,0), (1,2), (2,0), (2,1)
- `itertools.combinations`  # combinations(range(4), 3) --> (0,1,2), (0,1,3), (0,2,3), (1,2,3)
- `itertools.combinations_with_replacement`  # combinations_with_replacement('ABC', 2) --> AA AB AC BB BC CC
- `itertools.groupby` [itertools.groupby](https://docs.python.org/2/library/itertools.html#itertools.groupby)

- `collections.Counter` [collections.counter](https://pymotw.com/2/collections/counter.html)
- `collections.defaultdict` 
- `collections.namedtuple`
- `collections.OrderedDict`
- `collections.deque()`

- `any()`, `all()`
- `print [Ram, Rahim][False/True]`  equivalent to  `Ram if False else Rahim`
- `map`
- `reduce(lambda x,y:  x+y, ['a', 'b', 'c'])`  # will return 'abc'

####REGEX: `re` To be proficient in Regex -> _ My new year's resolution for the past 4 years _

- [The backslash-plague](https://docs.python.org/2/howto/regex.html#the-backslash-plague)

```
import re
re.search(r"ly", 'similarily')
asd = re.match(r"ly", "lysafdf")
asd.group()
asd.groups()
re.split("-","+91-011-2711-1111")

m = re.match(r'(?P<user>\w+)@(?P<website>\w+)\.(?P<extension>\w+)','myname@hackerrank.com')
m.groupdict()
{'website': 'hackerrank', 'user': 'myname', 'extension': 'com'}

p = re.compile(r'pattern')  
m = p.match('string')
m = p.search('string')
m = p.findall('string)
m = p.finditer('string')
m.group(); m.groups(); m.start(); m.end(); m.span();
```
- [Module Level Functions](https://docs.python.org/2/howto/regex.html#module-level-functions)  
- [Compilation Flags](https://docs.python.org/2/howto/regex.html#compilation-flags)
- [Non Capturing and Named Groups](https://docs.python.org/2/howto/regex.html#non-capturing-and-named-groups)
- [Look ahead assertions](https://docs.python.org/2/howto/regex.html#lookahead-assertions)
- [Common Problems with Regex](https://docs.python.org/2/howto/regex.html#common-problems)
- [splitting-strings](https://docs.python.org/2/howto/regex.html#splitting-strings)

```
"""
Sometimes you're not only interested in what the text between delimiters is, but also need to know what the delimiter was. If capturing parentheses are used in the RE, then their values are also returned as part of the list. Compare the following calls:
"""

>>> p = re.compile(r'\W+')
>>> p2 = re.compile(r'(\W+)')  # Note the parentheses here
>>> p.split('This... is a test.')
['This', 'is', 'a', 'test', '']
>>> p2.split('This... is a test.')
['This', '... ', 'is', ' ', 'a', ' ', 'test', '.', '']
```

- [Lookahead and lookbehind assertions](http://www.rexegg.com/regex-lookarounds.html)

>"With lookarounds, your feet stay planted on the string. You're just looking, not moving!"

| Lookaround | Name | What it Does |
|---    | --- | --- 
|`(?=foo)`	 |   Lookahead | Asserts that what immediately follows the current position in the string is foo
|`(?<=foo)` | Lookbehind	| Asserts that what immediately precedes the current position in the string is foo
|`(?!foo)`	| Negative Lookahead | Asserts that what immediately follows the current position in the string is not foo
|`(?<!foo)` | Negative Lookbehind | Asserts that what immediately precedes the current position in the string is not foo

Super class method call syntax:
2.7: super(childClass, self).method_of_parent()
3.X: super().method_of_parent()