stack1 segment stack 'stack'  ; ������� �����
db 10 dup ('stack')   ; ������������ ���� � ���'��  
stack1 ends  
 
dseg segment   ; ������� �����  
source db 1,2,3,4,5,6,7,8,9  ; ������� �������  
dest db 9 dup (?)   ; ���� �� ����������� �������  
dseg ends   
 
cseg segment   ; ������� ����  
assume cs: cseg, ds: dseg, ss: stack1 ; ��'���� �������� � ���������  
our_prog:    ; ����� ����� ��������  
mov ax, dseg   ; ����������� ������� DS  
mov ds, ax  
 
mov dest, 0   ; �������� ������� �����   
mov dest+1, 0   ; �������� ������� �����   
mov dest+2, 0   ; � �.�.   
mov dest+3, 0  
mov dest+4, 0 
mov dest+5, 0 
mov dest+6, 0 
mov dest+7, 0 
mov dest+8, 0 
 
mov al, source   
mov dest+8, al 
mov al, source+1   
mov dest+7, al 
mov al, source+2   
mov dest+6, al 
mov al, source+3   
mov dest+5, al 
mov al, source+4   
mov dest+4, al 
mov al, source+5   
mov dest+3, al   
mov al, source+6   
mov dest+2, al   
mov al, source+7   
mov dest+1 ,al   
mov al, source+8   
mov dest, al  
  
mov ah,4ch   ; ����� � DOS   
int 21h   
 
cseg ends    ; ����� �������� ����  
end our_prog