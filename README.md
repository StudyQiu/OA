# OA
简单的办公自动化系统  
1.这是一个简单的ssm框架  
2.开发工具idea  
3.Tomcat 9.0.46  
4.MySQL 8.0.25  
思维导图如下：  
![img](https://github.com/StudyQiu/OA/blob/main/img/01%20OA%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F%E9%A1%B9%E7%9B%AE%E8%AE%BE%E8%AE%A1%E6%80%9D%E7%BB%B4%E5%AF%BC%E5%9B%BE.png)  

结构如下：  
![img](https://github.com/StudyQiu/OA/blob/main/img/111.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/222.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/333.png)  

页面展示如下：  
![img](https://github.com/StudyQiu/OA/blob/main/img/1.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/2.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/3.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/4.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/5.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/6.png)  

功能模块如下：  
![img](https://github.com/StudyQiu/OA/blob/main/img/图片1.png)  
![img](https://github.com/StudyQiu/OA/blob/main/img/图片2.png)  

项目的不足：  
基本功能未完善  
用户的注册账号和忘记密码功能没写，日期输入过于繁琐，自动登录未完善。  
越权问题  
普通用户在url地址上输入特定的地址即可进入管理员页面。  
前后端数据校验  
项目未对从前台的数据进行校验，可能导致非法的数据的植入。  
上传文件的检测  
对上传的照片未进行检测，安全度不高，头像上传缓存没有刷新。  
修改未刷新  
当用户修改自己的部门信息时，如果是管理层改到其他部门，跳转到部门管理仍可以编辑，未实现实时刷新。  
