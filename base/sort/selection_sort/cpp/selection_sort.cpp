#include<cstdio>
using namespace std;
int main(){
	int lenth,i,j,temp,max;
	scanf("%d",&lenth);
	int a[lenth+1];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	}
	for(i=0;i<lenth-1;i++){
		max=i;
		for(j=i+1;j<lenth;j++){
			if(a[j]>a[max]){
				max=j;
			}
		}
		temp=a[i];
		a[i]=a[max];
		a[max]=temp;
	}
	for(i=0;i<lenth;i++){
		printf("%d ",a[i]);
	}
	return 0;
} 
