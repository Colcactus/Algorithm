"""
MIT License

Copyright (c) 2021 mieotoha <a7b8i06c49@gmail.com> and Colcactus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

伪代码:
函数 插入排序 输入 一个数组名称为array
    i 从 2 到 length
        当 array[j] > array[i] 时
            交换 array[j + 1] 和 array[j] 的值
        循环结束 
    i循环结束 
函数结束

注意:
数组中第一个值不需要进行比较，而 Julia 的数组索引从1开始，所以 i 循环中 i 的初始值为2
对于值 j 的要求只有 j < i 且 array [j] > array[i]
交换时 array[j + 1] = tmp 需要写在 for 循环的最后一行

结果:
``` julia
julia> a = [1, 5, 3, 7, 11, 9]
6-element Vector{Int64}:
  1
  5
  3
  7
 11
  9

julia> @time insertion_sort(a)
raw:[1, 5, 3, 7, 11, 9]
sorted:[1, 3, 5, 7, 9, 11]
  0.004453 seconds (46 allocations: 1.812 KiB)
```
"""

function insertion_sort(array::AbstractArray)
    println("raw:$array")
    for i = 2:length(array)
        tmp = array[i]
        j = i - 1

        while array[j] > array[i]
            array[j + 1] = array[j]
            j -= 1
        end
        array[j + 1] = tmp
    end

    println("sorted:$array")
end
