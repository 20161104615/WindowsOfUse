#include <stdio.h>
int main(){
    int i,n;
    char DLOfGPRMCNumber[24];
    char DLOfGPGGANumber[24];
    FILE *f,*p;
    f = fopen ("GPS.txt","r+");
    p = fopen ("GPS.txt","r+");
    if (f==NULL){
        printf("�ļ���ʧ��!\n");
    }
    else {
    	for(n=0;n<9;n++){
	    	fseek(f, 16+n*125L, SEEK_CUR);
	    	printf("GPRMC��γ��Ϊ��");
	        for (i=0;i<22;i++){
	            fscanf(f,"%c",&DLOfGPRMCNumber[i]);
	            printf("%c",DLOfGPRMCNumber[i]);
	        }
	        fseek(f,0L,SEEK_SET);
	        printf("\n");
		} 
        fclose(f);
    }
    
    if (p==NULL){
        printf("�ļ���ʧ��!\n");
    }
    else {
    	for (n=0;n<9;n++){
	    	fseek(p, 78+n*125L, SEEK_CUR);
	    	printf("GPGGA��γ��Ϊ��");
	        for (i=0;i<22;i++){
	            fscanf(p,"%c",&DLOfGPGGANumber[i]);
	            printf("%c",DLOfGPGGANumber[i]);
	        }
	        fseek(p,0L,SEEK_SET); 
	        printf("\n");
		}
        fclose(p);
    }
    return 0;
}
