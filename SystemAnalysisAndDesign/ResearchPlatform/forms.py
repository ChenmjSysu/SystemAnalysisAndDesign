from django import forms

class LoginForm(forms.Form):
	username = forms.CharField(required = True, label = u"username", error_messages = {"required": "Please input username"})
	password = forms.CharField(required = True, label = u"password", error_messages = {"required": "Please input password"})

	# def clean(self):
	# 	if not self.is_valid():
	# 		raise forms.ValidationError(u"username and password are required")
	# 	else:
	# 		clean_data = super(LoginForm, self).clean()

class RegisterForm(forms.Form):
	username = forms.CharField(required = True, label = u"username", error_messages = {"required": "Please input username"})
	password1 = forms.CharField(required = True, label = u"password1", error_messages = {"required": "Please input password1"})
	password2 = forms.CharField(required = True, label = u"password2", error_messages = {"required": "Please input password2"})
	email = forms.CharField(required = True, label = u"email", error_messages = {"required": "Please input email"})
	usertype = forms.CharField(required = False, label = u"usertype")

	# def clean(self):
	# 	if not self.is_valid():
	# 		raise forms.ValidationError(u"username and password are required")
	# 	else:
	# 		clean_data = super(LoginForm, slef).clean()