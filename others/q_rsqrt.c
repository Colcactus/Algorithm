/* 
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.
This file is part of Quake III Arena source code.
Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.
Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with Foobar; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================

参考原视频：Fast Inverse Square Root — A Quake III Algorithm https://youtu.be/p8u_k2LIZyo
源代码在https://github.com/id-Software/Quake-III-Arena/blob/dbe4ddb10315479fc00086f08e25d968b4b43c49/code/game/q_math.c 中的第552到564行，这里进行了简化和一些修改

请注意！
这段代码是不能在现代计算机上正常运行的
99%的程序员是不可能比现代编译器懂优化的，所以现代人实操时根本没必要抄这个代码：直接写1/sqrt(x)，然后交给编译器优化就行了
其它建议在https://www.bilibili.com/video/BV1v64y1i7KH 的评论区可以看到
*/

float q_rsqrt(float number){
    long i;
    float x2, y;
    const float threehalfs = 1.5F;

    x2 = number * 0.5F;
    y = number;
    i = * (long * ) &y;						 // evil floating point bit level hacking
    i = 0x5f3759df - (i >> 1);               // what the fuck?
    y = * (float * ) &i;
    y = y * (threehalfs - (x2 * y * y));     // 1st iteration
//	y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed
}

int main(){
    return q_rsqrt(114);
}
