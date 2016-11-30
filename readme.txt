1. 安装mysql 5.0和python 2.7并配置环境变量

2. 安装本项目所需要的python第三方包，如django、ueditor等
   我们在项目根目录下提供了一个requirements.txt文件，在连网状态下，在项目根目录执行"pip install -r requirements.txt" 即可进行安装。
   如果是windows系统，我们在项目根目录提供了一个install_packages_for_windows.bat的脚本，在连网状态下，执行脚本即可进行安装。

3. 导入数据库
   3.1 设置项目与数据库的连接：将文件 /SystemAnalysisAndDesign/SystemAnalysisAndDesign/settings.py 中信息修改为与本机对应的信息。包括19行设置mysql数据库用户名，20行设置mysql数据库密码，21行设置数据库所在的主机ip，22行设置数据库使用的端口。
   3.2 导入数据：在本项目的根目录下，我们提供了一个researchplatform.sql的mysql脚本，使用者需要先将该sql文件的数据导入mysql数据库。导入数据后，会有一个超级管理员账号，账号：fuhuamosi，密码：1994720

4. 启动服务器
   进入 /SystemAnalysisAndDesign/ 目录，在命令行窗口运行"python manage.py runserver 端口号"，等服务器启动完成后，即可在浏览器通过"127.0.0.1:端口号"来访问网站。
  