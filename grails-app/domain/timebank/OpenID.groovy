package timebank



class OpenID {

	String url

	static belongsTo = [user: User]

	static constraints = {
		url unique: true
	}
}
