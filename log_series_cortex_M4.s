     area     appcode, CODE, READONLY
     export __main
	 ENTRY
__main  function

	   VLDR.F32 s1,=1; // x = 1 :- ln(1+1) = ln2 = 0.693 (approx. ideal value)
	   VLDR.F32 s2,=1; // n=1 :- used to increment the power of x for each term :- eg: x,x^2,x^3......
	   VLDR.F32 s3,=0; // counter = 0
	   VLDR.F32 s4,=1; // used for incrementing the counter by 1
	   VLDR.F32 s5,=0; // sum = 0
	   VLDR.F32 s6,=0; // term = 0

LOOPP  VADD.F32 s3,s3,s4; // count = count + 1
       VMUL.F32 s2,s2,s1; // increment power of x :- n= x,x^3,x^5,etc
	   VDIV.F32 s6,s2,s3; // term = n/count = x/1,x^3/3,x^5/5,etc
	   VADD.F32 s5,s5,s6; // sum = sum + term
	   B LOOPN

LOOPN  VADD.F32 s3,s3,s4; // count = count + 1
       VMUL.F32 s2,s2,s1; // increment power of x :- n= x^2,x^4,x^6,etc
	   VDIV.F32 s6,s2,s3; // term = n/count = x^2/2,x^4/4,x^6/6,etc
	   VSUB.F32 s5,s5,s6; // sum = sum - term = x - x^2/2 + x^3/3 - x^4/4 + x^5/5.....
	   B LOOPP
     // after observing upto 24 terms, value stored at s5(sum) = 0x3f2c392c = 0.672747373581

     endfunc
     end
