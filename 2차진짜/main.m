%드론 연결
drone = ryze();
cam = camera(drone);

%드론 이륙
takeoff(drone);

%roll 제어(오른쪽으로 이동)
moveleft(drone,'distance',1,'speed',0.6)
%yaw 제어(20도 회전)
turn(drone,deg2rad(20));
%pitch 제어(앞으로 이동)
moveforward(drone,'distance',0.7,'speed',0.6)
%yaw 제어(70도 회전)
turn(drone,deg2rad(70));
%pitch 제어(앞으로 전진)
moveforward(drone,'distance',0.5,'speed',0.6)
pause(0.5);
%사진 촬영
pic1 = snapshot(cam);
pause(0.5);
%yaw 제어(-20도 회전)
turn(drone,deg2rad(-20));
%roll 제어(오른쪽으로 이동)
moveright(drone,'distance',0.7,'speed',0.6)
%드론 착륙
land(drone);

%사진 저장
save('task2.mat','pic1');
