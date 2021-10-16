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

"""

function bucket_sort(arr::Vector{T}, l::Int=length(arr)) where T
    if l==0
        return
    end

    max = maximum(arr)
    min = minimum(arr)
    r = (max-min+1)/l
    buckets = Array{T, 1}[[] for a in 1:l]

    for i in arr
        push!(buckets[floor(Int, (i-min)/r)+1], i)
    end

    for bucket in buckets
        for i in 1:length(bucket)
            val = bucket[i]
            idx = i
            while idx > 1 && val < bucket[idx-1]
                bucket[idx] = bucket[idx-1]
                idx = idx - 1
            end

            bucket[idx] = val
        end
    end
    copy!(arr, vcat(buckets...))
end
