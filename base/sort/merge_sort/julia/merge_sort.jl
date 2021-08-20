"""
MIT License

Copyright (c) 2021 hattori-emi <a7b8i06c49@outlook.com> and Colcactus

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

结果：
julia> @time merge_sort(a)
raw:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
  0.000387 seconds (283 allocations: 11.781 KiB)

"""

function merge_sort(array::Vector{T}, arraybegin::Int=1, arrayend::Int=length(array), temp::Vector{T}=Vector{T}(undef, arrayend - arraybegin + 1))where T
    println("raw:$array")
    if arraybegin >= arrayend
        return
    end
    middle = (arraybegin + arrayend) >> 1

    merge_sort(array, arraybegin, middle)
    merge_sort(array, middle + 1, arrayend)

    low = arraybegin
    high = middle + 1

    for t_pos = 1:arrayend - arraybegin + 1
        if low <= middle && (high > arrayend || array[low] < array[high])
            temp[t_pos] = array[low]
            low += 1
        else
            temp[t_pos] = array[high]
            high += 1
        end
    end
    for i = arraybegin:arrayend
        array[i] = temp[i - arraybegin + 1]
    end
    println("sorted:$array")
end
