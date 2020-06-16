stack1 segment stack 'stack'  ; сегмент стека
db 10 dup ('stack')   ; резервуванн€ м≥сц€ в пам'€т≥  
stack1 ends  
 
dseg segment   ; сегмент даних  
source db 1,2,3,4,5,6,7,8,9  ; вих≥дна таблиц€  
dest db 9 dup (?)   ; м≥сце п≥д результуючу таблицю  
dseg ends   
 
cseg segment   ; сегмент коду  
assume cs: cseg, ds: dseg, ss: stack1 ; зв'€зок сегмент≥в з рег≥страми  
our_prog:    ; точка входу програми  
mov ax, dseg   ; ≥н≥ц≥ал≥зац≥€ рег≥стра DS  
mov ds, ax  
 
mov dest, 0   ; обнул≥нн€ першого байта   
mov dest+1, 0   ; обнул≥нн€ другого байта   
mov dest+2, 0   ; ≥ т.п.   
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
  
mov ah,4ch   ; вих≥д в DOS   
int 21h   
 
cseg ends    ; к≥нець сегмента коду  
end our_prog