#include <stdio.h>
int main(){
    int i,n,k;
    char DLOfGPRMCNumber[24],DLOfGPGGANumber[24];
    FILE *f,*p;
    f = fopen ("GPS.txt","r+");
    p = fopen ("GPS.txt","r+");
    printf("�������ѯ��������");
    scanf("%d",&k);
    if (f==NULL&&p==NULL){
        printf("�ļ���ʧ��!\n");
    }
    else {
    	for(n=0;n<k;n++){
	    	fseek(f, 16+n*125L, SEEK_CUR);
	    	printf("GPRMC��γ��Ϊ��");
	        for (i=0;i<22;i++){
	            fscanf(f,"%c",&DLOfGPRMCNumber[i]);
	            printf("%c",DLOfGPRMCNumber[i]);
	        }
	        fseek(f,0L,SEEK_SET);
	        printf("\n");
	        fseek(p, 78+n*125L, SEEK_CUR);
	    	printf("GPGGA��γ��Ϊ��");
	        for (i=0;i<22;i++){
	            fscanf(p,"%c",&DLOfGPGGANumber[i]);
	            printf("%c",DLOfGPGGANumber[i]);
	        }
	        fseek(p,0L,SEEK_SET); 
	        printf("\n");
		} 
        fclose(f);
        fclose(p);
    }
    return 0;
}
