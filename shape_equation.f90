!JACQUES PROST(2002)/SHAPE_VESICLE/SUBROUTINE/RK4/SHOOTING TECHNIQUE
!psi(s0)=y(1), psidot(s0)=y(2), psidotdot(s0)=y(3), r(s0)=y(4), z(s0)=y(5),Area=y(6), Volume=y(7),Reduced volume=y(8)
!CHECK: psi(s1)=pi, gamma(s1)=0
!!!*********************************
program shape_equation_c
implicit none
integer :: k, ios,l
integer, parameter :: imax = 50000
integer, parameter :: n = 7
double precision :: y(8),dyds(8),yout(8),h,s
double precision :: P_bar,sigma_bar,Co,epsilon,f_bar,RO,fO,b
double precision :: pi=3.14159265358979323846
common/prop/P_bar,sigma_bar,Co,f_bar
external rk4, deriv

open (unit=42, file="Jacques1_thirdord_working_data.dat", status="unknown", iostat=ios)

if (ios /= 0) then
   print *, "File operation problem. iostat =", ios
   stop
endif

 sigma_bar = 0.5d0   ! Area Lagrange Multiplier
    P_bar = 0.d0        ! Volume Lagrange Multiplier
    f_bar = 0.2d0      ! Force parameter
    h = -0.001d0        ! Step size
    Co = 0.4d0 !Spontaneous Curvature
    
    epsilon = 0.00274705662d0!GUESS
    !epsilon = 0.002499666435d0 
 !epsilon_values = (/0.0020967865659d0, 0.002096786566d0)

s = 0.0d0
y(4) = 20.d0
y(1) = Dasin(f_bar/(y(4)*sigma_bar))-epsilon
y(2) = -Dsin(y(1))/y(4)
y(3) = (-0.5d0*Dsin(y(1))*y(2)**2.d0-y(2)*Dcos(y(1))**2.d0/y(4) &
+Dsin(y(1))*0.5*(1.d0+Dcos(y(1))**2.d0)/y(4)**2.d0+sigma_bar*Dsin(y(1))-P_bar*y(4)*0.5d0- &
f_bar/y(4)+Co**2.d0*Dsin(y(1))*0.5-Co*Dsin(y(1))**2.d0/y(4))/Dcos(y(1))
y(5) = 0.0d0
y(6) = 0.0d0
y(7) = 0.0d0
h = -0.001d0
write (42,*) s,y(1),y(2),y(3),y(4),y(5),y(6),y(7),y(8)
do k = 1,imax !number of iterations
call rk4(s,y,dyds,n,h,yout,deriv)
y(1)=yout(1)
y(2)=yout(2)
y(3)=yout(3)
y(4)=yout(4)
y(5)=yout(5)
y(6)=yout(6)
y(7)=yout(7)
y(8)=y(7)/(4.d0*pi*(sqrt(y(6)/4/pi))**3.d0/3.d0)
!y(8) = y(7) / (4.d0 * pi * (sqrt(y(6) / (4.d0 * pi)))**3.d0 / 3.d0)
print *,"final value of s,y1,y2,y3,y4,y5,y6,y7,y8:","s = ", s, " y1 = ", yout(1), " y2 = ", yout(2), " y3 = ", yout(3), " y4 = ", yout(4), &
           " y5 = ", yout(5), " y6 = ", yout(6), " y7 = ", yout(7), " y8 = ", yout(8)
s=s+h
write (42, '(F10.4, 1X, F10.4, 1X, F10.4, 1X, F10.4, 1X, F10.4, 1X, F10.4, 1X, F10.4, 1X, F10.4, 1X, F10.4)') s, y(1), y(2), y(3), y(4), y(5), y(6), y(7), y(8)
!if (s < -19.962000000001414) exit
end do
end file 42
rewind 42
close(42)
end program shape_equation_c
!****************************************
subroutine rk4(s,y,dyds,n,h,yout,deriv)
implicit none
external deriv
double precision :: s,h,y(n),dyds(n),yout(n),yt(n),dyt(n),dym(n)
integer :: i,n
call deriv(s,y,dyds)
do i = 1,n
yt(i)=y(i)+0.5d0*h*dyds(i)
end do
call deriv(s+0.5d0*h,yt,dyt)
do i = 1,n
yt(i)=y(i)+0.5*h*dyt(i)
end do
call deriv(s+0.5d0*h,yt,dym)
do i = 1,n
yt(i)=y(i)+h*dym(i)
dym(i) = dyt(i) + dym(i)
end do
call deriv(s+h,yt,dyt)
do i = 1,n
yout(i)=y(i)+h*(dyds(i)+dyt(i)+2.d0*dym(i))/6.d0
end do
end subroutine rk4
!********************************
subroutine deriv(s,y,dyds)
implicit none
double precision :: s, y(7),dyds(7)
double precision :: P_bar,sigma_bar,n,Co,f_bar,RO,b
double precision :: pi=3.14159265358979323846
common/prop/P_bar,sigma_bar,Co,f_bar
write (*,*) f_bar
dyds(1) = y(2)
dyds(2) = y(3)
dyds(3) = -0.5d0*y(2)**3.d0 &
-2.d0*y(3)*Dcos(y(1))/y(4) &
+1.5d0*Dsin(y(1))*y(2)**2.d0/y(4) &
+ (3.d0*Dcos(y(1))**2.d0-1.d0)*y(2)*0.5d0/y(4)**2.d0 &
+ sigma_bar*y(2) &
-P_bar &
+sigma_bar*Dsin(y(1))/y(4) &
-(1.d0+Dcos(y(1))**2.d0)*0.5d0*Dsin(y(1))/y(4)**3.d0 &
    +Co**2.d0*Dsin(y(1))*0.5/y(4)+(Co**2.d0*0.5-2*Co*Dsin(y(1))/y(4))*y(2)
dyds(4) = Dcos(y(1))
dyds(5) = -Dsin(y(1))
dyds(6) = 2.d0*pi*y(4)
dyds(7) = pi*Dsin(y(1))*y(4)**2.d0
end subroutine deriv




