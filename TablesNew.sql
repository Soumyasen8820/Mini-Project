create schema mini



drop table mini.EmployeeDetails

create table mini.EmployeeDetails(
 EmployeeId int identity not null,
 FirstName varchar(20) not null,
 LastName varchar(20) not null,
 Age int not null,
 Gender varchar(10) not null,
 AddressofEmp varchar(50) not null,
username varchar(15) not null unique,
password varchar(20) not null,
managerId int primary key
)
select * from mini.EmployeeDetails

create proc mini.Employeelogin(

@username varchar(20),
@password varchar(20)
)
as
begin 
Select username,password from mini.EmployeeDetails where Username=@Username
end


select *from mini.EmployeeDetails
delete mini.EmployeeDetails where EmployeeId=5


create table mini.AssignManager(
 ManagerId int foreign key references mini.EmployeeDetails(ManagerId),
 ManagerName varchar(30) not null
)


create table mini.Managerlogin
(
managerId int foreign key references mini.AssignManager(ManagerId),
username varchar(20) not null,
password varchar(20) not null
)

create proc mini.EmployeeLogin(
@UserName varchar(20),
@password varchar(20)


create table mini.TravelAgentlogin
(
AgentUsername varchar(15) not null,
AgentPass varchar(20) not null
)
insert into mini.TravelAgentlogin values('agent','agent')


create table mini.AdminLogin
(
AdminUsername varchar(15) unique not null,
AdminPass varchar(20) not null
)
insert into mini.AdminLogin values('admin','admin')



create table mini.TravelRequest
(
RequestId int identity not null,
RequestDate date not null,
FromLocation varchar(20) not null,
ToLocation varchar(50) not null,
EmployeeId int not null,
ManagerId int not null,
CurrentStatus varchar(150) 

)



 

-----------------------------------------------------------------------------------------------------------------------------



drop proc mini.addEmployee
create proc mini.addEmployee(
 @EmployeeId int out,
 @FirstName varchar(20),
 @LastName varchar(20),
 @Age int,
 @Gender varchar(10),
 @AddressofEmp varchar(50),

 @uname varchar(20),
 @password varchar(20),
  @ManagerId int 
 )
 as 
 begin
 insert  into mini.EmployeeDetails values(@FirstName,@LastName,@Age,@Gender,@AddressofEmp,@uname,@password,@ManagerId )
 select  @EmployeeId=SCOPE_IDENTITY()
 end




 create proc mini.DeleteEmployee
(
@EmployeeId int
)
as
begin
	delete from  mini.EmployeeDetails
	where EmployeeId = @EmployeeId
end




create procedure mini.AssignManager
(
@ManagerId int
)
as
begin
 update  mini.EmployeeDetails set ManagerId=@ManagerId
end




create procedure mini.DisplayRequest
(
@ManagerId int
)
as
begin
 select * from  mini.TravelRequest where ManagerId=@ManagerId
end



create procedure mini.bookingRequest(
@RequestId int out,
@requestDate date,
@FromLocation varchar(20),
@ToLocation varchar(20),
@employeeId int,
@ManagerId int
@CurrentStatus varchar(150) 
)
as
begin
insert into mini.TravelRequest values(@requestDate, @FromLocation,@ToLocation,@employeeId, @ManagerId,@CurrentStatus)
select  @RequestId=SCOPE_IDENTITY()
end




create procedure mini.updateStatus
(
@CurrentStatus varchar(150) ,
@EmployeeId int
)
as
begin
 update mini.TravelRequest set CurrentStatus= @CurrentStatus where EmployeeId=@EmployeeId
end




create procedure mini.Cancelrequest
(
@employeeid int
)
as
 begin
  delete from mini.TravelRequest where employeeid=@employeeid
end


------------------------------------------------------------------------------------------------------------------------------------------------------















