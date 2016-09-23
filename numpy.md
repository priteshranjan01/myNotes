[ Markdown basic marking and formatting syntax ]( https://help.github.com/articles/basic-writing-and-formatting-syntax/ ) 

Book : Numpy third edition, by Ivan Idris, PACKT Publishing

# Python Numpy notes: 

## Chapter 2: Begininig with Numpy Fundamentals

```
import numpy as np
arange([start,] stop[, step,], dtype=None)
array(object, dtype=None, copy=True, order=None, subok=False, ndmin=0)
```
**Some Array Attributes**: 
-   `dtype` , `shape`, `size`, `ndim`, `itemsize`, `nbytes`, `T` (T for transpose), `real`, `imag`, `flat` ( returns a `numpy.flatiter` object)
-   `np.finfo(np.float64) # request information for floating point types`
- numpy numerical types 
    -    bool, inti, int8, int16, int32, int64, float16, float32, float64 or float,complex64, complex128
    
**Create a custom data type**
```
myType = np.dtype([('name', np.str_, 40), ('numitems', np.int32), ('price', np.float32)])
items = np.array([('asdasdf', 32, 50.4), ('sadfasfdsdfasffsafasdf', 21, 90.44)], dtype = myType)
```
**Note**: Use to ellipsis (...) to represent multiple colons(:::). 
```
asd = np.arange(24).reshape(2,3,4)
asd[...] 
asd.ravel()  # Flattens a muiti-dimensional array into 1D, returns just the view of old array
asd.flatten()  # Does the same as ravel but creates a new object. 
asd.shape = (6,4)  # Changes the array's shape directly
asd.resize(12,2)  # Changes the array shape, and adds array copies of the input array, if necessary
asd.transpose()
asd.tolist()  # Convert to a python list
```
**Note**: slicing with python lists creates a new object at different location, while in numpy it creates a shallow copy

**Stacking**:
```
a = np.arange(9).reshape(3,3)
b = 2 * a
np.hstack((a,b) or np.concatenate((a,b), axis=1)
np.vstack((a,b)) or np.concatenate((a,b), axis=0)  # default value of axis is 0
np.dstack((a,b))
np.column_stack((a,b))
np.row_stack((a,b))
```
**Splitting**:
```
a = np.arange(9).reshape(3,3)
np.hsplit(a,3) or np.split(a, 3, axis=1)
np.vsplit(a,3) or np.split(a, 3, axis=0)
asd = np.arange(27).reshape(3,3,3)
np.dsplit(asd, 3)
```

## Chapter 3: Getting Familiar with commonly used functions
```
np.nan 
np.ones(shape, dtype=None, order='C')  # Return a new array of given shape and type, filled with ones.
np.zeros(shape, dtype=float, order='C')  # Return a new array of given shape and type, filled with zeros.
np.average(a, axis=None, weights=None, returned=False)  # Compute the weighted average along the specified axis.
np.mean(a, axis=None, dtype=None, out=None, keepdims=False)  # Compute the arithmetic mean along the specified axis.
np.amax(a, axis=None, out=None, keepdims=False)  # Return the maximum of an array or maximum along an axis.
np.amin(a, axis=None, out=None, keepdims=False)  # Return the minimum of an array or minimum along an axis.
np.nanmax(a, axis=None, out=None, keepdims=False)  # The maximum value of an array along a given axis, ignoring any NaNs.
# NOTE: amax is same as max and amin is same as min
np.ptp(a, axis=None, out=None)  # Range of values (maximum - minimum) along an axis. PTP stands for 'peak to peak'
np.median(a, axis=None, out=None, overwrite_input=False, keepdims=False)  # Compute the median along the specified axis.
np.msort(a)  # Return a copy of an array sorted along the first axis.
np.var(a, axis=None, dtype=None, out=None, ddof=0, keepdims=False)  # Compute the variance along the specified axis. or on flattened array if axis not specified
np.std(a, axis=None, dtype=None, out=None, ddof=0, keepdims=False)  # Compute the standard deviation along the specified axis.
np.where(condition, [x, y])  # Return elements, either from `x` or `y`, depending on `condition`.
np.take(a, indices, axis=None, out=None, mode='raise')  # Take elements from an array along an axis. Similar to indexing arrays using arrays
np.sqrt(x[, out])  # Return the positive square-root of an array, element-wise.
np.apply_along_axis(func1d, axis, arr, *args, **kwargs)
np.maximum(x1, x2[, out])  # Element-wise maximum of array elements. Compare two arrays and returns a new array containing the element-wise maxima.
np.exp(x[, out])  # Calculate the exponential of all elements in the input array.
np.linspace(start, stop, num=50, endpoint=True, retstep=False, dtype=None)  # Returns `num` evenly spaced samples, calculated over the interval [`start`, `stop`]
np.ndarray.fill(value)  # Fill the array with a scalar value.
np.dot(a, b, out=None)  # Dot product of two arrays. For 2-D arrays it is equivalent to matrix multiplication, and for 1-D arrays to inner product of vectors (without complex conjugation).
np.clip(a, a_min, a_max, out=None)  # Clip (limit) the values in an array.
np.compress(condition, a, axis=None, out=None)  # Return selected slices of an array along given axis.
np.prod(a, axis=None, dtype=None, out=None, keepdims=False)  # Return the product of array elements over a given axis.
np.cumprod(a, axis=None, dtype=None, out=None)  # Return the cumulative product of elements along a given axis.
np.nanmean(a, axis=None, dtype=None, out=None, keepdims=False)  # Compute the arithmetic mean along the specified axis, ignoring NaNs.
np.nanvar(a, axis=None, dtype=None, out=None, ddof=0, keepdims=False)  # Compute the variance along the specified axis, while ignoring NaNs.
np.nanstd(a, axis=None, dtype=None, out=None, ddof=0, keepdims=False)  # Compute the standard deviation along the specified axis, while ignoring NaNs.

```
### File I/O
```
identity_matrix = np.eye(3)  # creates an identity matrix with 3 ones along the diagonal
np.savetxt('filename.txt', identity_matrix)  # Writes the matrix to the filename
```
#### CSV Files
```
np.loadtxt(fname, dtype=<class 'float'>, comments='#', delimiter=None, converters=None, skiprows=0, usecols=None, unpack=False, ndmin=0)
    """ Load data from a text file.
    Each row in the text file must have the same number of values.
    """
```
### Dates
```
def str_date_to_num(date_str):
	# [strftime and strptime behaviour](https://docs.python.org/2/library/datetime.html#strftime-and-strptime-behavior)
	return datetime.datetime.strptime(date_str, "%d-%m-%Y").date().weekday() 
# Assuming column number 1 has the dates as strings
dates = np.loadtxt('file_having_dates.csv', delimiter=',', converters={1:str_date_to_num}, unpack=True, usecols=(1,))

np.datetime64('2015-09-05')
```