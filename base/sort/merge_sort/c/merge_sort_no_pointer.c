/*
MIT License

Copyright (c) 2021 Anslate <1959719289@qq.com> and Colcactus

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

输入样式：
例：
5
1 3 2 5 4
共两行
第一行n表示第二行的数据数量
第二行数据是待排序数组，共n个，数据之间加空格
输出样式：
例：
5 4 3 2 1
共一行
表示排序完毕的数组

数据不超过int范围

这是无指针版，原版可以看merge_sort.c
*/
#include<stdio.h>
int lenth=5;
//长度，相当于第一行输入
int a[7]={1,3,2,5,4};
//待排序数组，相当于第二行输入
void merge_sort(int left,int right){
	int i;
	int mid=(right+left)/2;
	if((right-left)<=1){
		return;
	}
	merge_sort(left,mid);
	merge_sort(mid,right);
	int b[right-left],left_p,right_p;
	left_p=left;
	right_p=mid;
	for(i=0;i<(right-left);i++){
		if(left_p==mid){
			b[i]=a[right_p];
			right_p++;
			continue;
		}
		if(right_p==right){
			b[i]=a[left_p];
			left_p++;
			continue;
		}
		if(a[left_p]>a[right_p]){
			b[i]=a[left_p];
			left_p++;
			continue;
		}
		if(a[left_p]<=a[right_p]){
			b[i]=a[right_p];
			right_p++;
			continue;
		}
	}
	for(i=0;i<(right-left);i++){
		a[left+i]=b[i];
	}
	return;
}
void main(){
	merge_sort(0,lenth);
	int i;
	for(i=0;i<lenth;i++){
		printf("%d ",a[i]);
	}
}
