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

由于变量作用域的缘故，我稍微用了点指针，无指针的可以看merge_sort_no_pointer.cpp
*/
#include<cstdio>
using namespace std;
void merge_sort(int left,int right,int *p){
	int i;
	int mid=(right+left)/2;
	if((right-left)<=1){
		return;
	}
	merge_sort(left,mid,p);
	merge_sort(mid,right,p);
	int b[right-left],left_p,right_p;
	left_p=left;
	right_p=mid;
	for(i=0;i<(right-left);i++){
		if(left_p==mid){
			b[i]=*(p+right_p);
			right_p++;
			continue;
		}
		if(right_p==right){
			b[i]=*(p+left_p);
			left_p++;
			continue;
		}
		if(*(left_p+p)>*(right_p+p)){
			b[i]=*(p+left_p);
			left_p++;
			continue;
		}
		if(*(left_p+p)<=*(right_p+p)){
			b[i]=*(p+right_p);
			right_p++;
			continue;
		}
	}
	for(i=0;i<(right-left);i++){
		*(left+i+p)=b[i];
	}
	return;
}
int main(){
	int i,lenth;
	scanf("%d",&lenth);
	int a[lenth];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	}
	merge_sort(0,lenth,&a[0]);
	for(i=0;i<lenth;i++){
		printf("%d ",a[i]);
	}
	return 0;
}
