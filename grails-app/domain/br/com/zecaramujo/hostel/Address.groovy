package br.com.zecaramujo.hostel

class Address {
	
	long id
	String country
	String state
	String city
	String address1
	String address2
	String zipCode
	
	static belongsTo = [client: Client]
	
    static constraints = {
    }
}
