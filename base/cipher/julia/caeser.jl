"""
MIT License

Copyright (c) 2023 mieotoha <a7b8i06c49@gmail.com> and Colcactus

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

# 参数:
- `rot`: 希望的偏移量
- `s` : 需要转换的句子

"""
function caesar(rot, s)
    rotate = function (r)
        if 'a' <= r <= 'z'
            v = ((r - 'a') + rot) % 26
            return v + 'a'
        end
        if 'A' <= r <= 'Z'
            v = ((r - 'A') + rot) % 26
            return v + 'A'
        end
        return r
    end
    if s isa Char
        return rotate(s)
    end
    result = ""
    for r in s
        result *= rotate(r)
    end
    return result
end
