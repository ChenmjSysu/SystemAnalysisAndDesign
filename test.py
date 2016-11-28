import urllib
import urllib2
import cookielib

method = "POST"
url = "http://localhost:8000/delete/Notice"
param = {}
param["username"] = "zhanghao"
param["password"] = "mima"
param["password1"] = "mima"
param["password2"] = "mima"
param["email"] = "yaxue@mail2.sysu.edu.cn"
param["usertype"] = "LAB"
param["title"] = "title22"
param["content"] = "contesdasdjijqodnsnt1content1content1CC~!@#$%^&*())_+"
param["aid"] = 2


# POST
if method == "POST":
	cookie = cookielib.CookieJar()
	handler = urllib2.HTTPCookieProcessor(cookie)
	opener = urllib2.build_opener(handler)
	# login
	response = urllib2.urlopen("http://localhost:8000/login/", urllib.urlencode({"username": "zhanghao", "password": "mima"}))	
	print response.read()
	# do other thing
	postParam = urllib.urlencode(param)
	print method
	print url
	print postParam
	response = opener.open(url, postParam)	
	print response.read()

else:
	url = url + "?" + urllib.urlencode(param)
	print method
	print url
	response = urllib2.urlopen(url)	
	print response.read()
