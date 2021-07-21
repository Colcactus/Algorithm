#include<stdio.h>
void main(){
	int A=7;
	int B=5;
	int M=11;
	int X=2;
	// X是随机数种子
	int i;
	for(i=0;i<11;i++){
		X=(A*X+B)%M;
		printf("%d\n",X); 
	} 
} 
