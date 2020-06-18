--★★★★SQL快速开发工具 Powered by 华夏互联hx008.com数据库开发团队★★★
--use 数据库名
declare @Uname varchar(50),@password varchar(50) 
set @Uname ='Uname3'
set @password='password3'

--exec sp_addrolemember 'db_owner',@Uname
--这一行最后单独执行

exec sp_addlogin @Uname,@password  --创建登陆
exec sp_adduser @Uname,@Uname      --创建用户

/*
EXEC sp_revokedbaccess N'Uname3'   --1、移除用户对数据库的访问权限
EXEC sp_droplogin N'Uname3'        --2、删除登录用户

--查询当前数据库可连接的用户:
select DbRole = g.name, MemberName = u.name, MemberSID = u.sid
  from sys.database_principals u, sys.database_principals g, sys.database_role_members m
 where g.principal_id = m.role_principal_id
   and u.principal_id = m.member_principal_id
 order by 1, 2
 
--更改特定用户的登陆密码
ALTER LOGIN [用户名] WITH PASSWORD=N'密码'

--修改密码
ALTER LOGIN [sa] WITH PASSWORD=N'xxxxxx'

--从当前数据库中删除特定或孤立用户
USE [特定数据库]
DROP USER [dbo]       --删除孤立用户
DROP SCHEMA [用户名]  --从架构中删除

--从MSSQL实例中彻底删除用户之法
DROP LOGIN [usname]
DROP SCHEMA [usname]  --删除架构
 
--★★★★★★★★★★★★★备份数据库：
BACKUP DATABASE "数据库名" TO DISK ='D:\data.bak' with init

--简单还原数据库
RESTORE DATABASE "数据库名" FROM DISK='D:\data.bak';

--还原数据库到指定目录
restore database [数据库名] from disk='D:\data.bak'
 with move 'Data' to 'D:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\Data.MDF',
      move 'Data_log' to 'D:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\Data_log.ldf', REPLACE
      
--查看备份文件逻辑文件名 
restore filelistonly from disk='D:/data.bak'

--查询数据库逻辑文件名
SELECT name FROM sys.database_files

--修改数据文件或日志文件的逻辑名称
ALTER DATABASE 数据库名 MODIFY FILE (NAME = 原始逻辑文件名, NEWNAME = 新逻辑文件名) 

--★★★建立数据库
CREATE DATABASE DbName 
ON 
( NAME='临时的_Data', 
FILENAME='D:\临时的.mdf', 
SIZE=5MB, 
MAXSIZE=50MB, 
FILEGROWTH=10% 
) 
LOG ON 
( 
NAME='临时的_LOG', 
FILENAME='D:\临时的.ldf', 
SIZE=2MB, 
MAXSIZE=5MB, 
FILEGROWTH=1MB 
) 

--NAME=逻辑名称 
--FILENAME=数据库的物理文件名称 
--SIZE=初始大小 
--MAXSIZE=数据库最大尺寸 
--FILEGROWTH=文件增长程度
--详细出处参考：http://www.jb51.net/article/28973.htm


drop database DbName             --删除数据库

EXEC sp_renamedb '原数据库名', '新数据库名'     --数据库更名

ALTER DATABASE [数据库名] SET RECOVERY SIMPLE WITH NO_WAIT --数据库日志压成简单模式

update zl_manager set adminpassword='7fef6171469e80d32c0559f88b377245' where adminid=1  --重设后台admin密码为admin888

--高级教程：http://www.zoomla.cn/help/tech/2035.shtml
*/