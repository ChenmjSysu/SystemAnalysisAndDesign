from django import forms

class LoginForm(forms.Form):
	username = forms.CharField(required = True, label = u"username", error_messages = {"required": "Please input username"})
	password = forms.CharField(required = True, label = u"password", error_messages = {"required": "Please input password"})

	def clean(self):
		if not self.is_valid():
			raise forms.ValidationError(u"username and password are required")
		else:
			clean_data = super(LoginForm, slef).clear()

class RegisterForm(forms.Form):
	username = forms.CharField(required = True, label = u"username", error_messages = {"required": "Please input username"})
	password = forms.CharField(required = True, label = u"password", error_messages = {"required": "Please input password"})
	email = forms.CharField(required = True, label = u"email", error_messages = {"required": "Please input email"})

	def clean(self):
		if not self.is_valid():
			raise forms.ValidationError(u"username and password are required")
		else:
			clean_data = super(LoginForm, slef).clear()