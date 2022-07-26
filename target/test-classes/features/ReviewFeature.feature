@End2End
Feature: Review Project

Scenario: End to end account creation.
	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor", "password": "tek_supervisor"}
	When method post 
	Then status 200
	And def generatedToken = response.token
	And print generatedToken 
	And def generator = Java.type('tigers.api.review.fake.data.DataGenerator')
	And def email = generator.getEmail()
	And def firstName = generator.getFirstName()
	And def lastName = generator.getLastName()
	And def Dob = generator.getDob()
	Given path "/api/accounts/add-primary-account"
	And request
	"""
	{
  "email": "#(email)",
  "firstName": "#(firstName)",
  "lastName": "#(lastName)",
  "title": "Ms.",
  "gender": "FEMALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "Unemployed",
  "dateOfBirth": "#(Dob)",
  "new": true
    }
    
	"""
	And header Authorization = "Bearer " + generatedToken
	When method post
	Then status 201
	And def generatedId = response.id
	And print response
	And def generator = Java.type('tigers.api.review.fake.data.DataGenerator')
	And def streetAddress = generator.getStreetAddress()
	And def city = generator.getCity()
	And def state = generator.getState()
	And def postalCode = generator.getPostalCode()
	And def countryCode = generator.getCountryCode()
	Given path "/api/accounts/add-account-address"
	And request
	"""
	
	{"addressType": "House",
  "addressLine1": "#(streetAddress)",
  "city": "#(city)",
  "state": "#(state)",
  "postalCode": "#(postalCode)",
  "countryCode": "#(countryCode)",
  "current": true
    }
    
	"""
	And header Authorization = "Bearer " + generatedToken
	And param primaryPersonId = generatedId
	When method post
	Then status 201
	And print response 
	And def generator = Java.type('tigers.api.review.fake.data.DataGenerator')
	And def phoneNumber = generator.getPhoneNumber()
	And def extension = generator.getExtension()
	Given path "/api/accounts/add-account-phone"
	And header Authorization = "Bearer " + generatedToken
	And param primaryPersonId = generatedId
	And request
	"""
	{"phoneNumber": "#(phoneNumber)",
  "phoneExtension": "#(extension)",
  "phoneTime": "EST",
  "phoneType": "CellPhone"
	}
	"""
	When method post 
	Then status 201
	And print response 
	Given path "/api/accounts/add-account-car"
	And header Authorization = "Bearer " + generatedToken
	And param primaryPersonId = generatedId
	And request 
	"""
	{
  "make": "Honda",
  "model": "Accord",
  "year": "2020",
  "licensePlate": "XYZ-123"
	}
	"""
	When method post 
	Then status 201 
	And print response
	
	
	