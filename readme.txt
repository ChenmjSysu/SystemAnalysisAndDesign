ResearchPlatform/templates 放html文件
ResearchPlatform/static 放css/js/图片这些文件，地址“/static/”可以引用这个目录下的文件，例如"localhost:port/static/css/test.css"

django版本: 1.5.6

开启django服务器：
在"manage.py"的目录输入"manage.py runserver"
服务器开启后，访问网站的默认地址是"localhost:8000"

SystemAnalysisAndDesign/urls.py 这个文件设置地址到处理函数或者模板（也就是templates里的html）的映射
