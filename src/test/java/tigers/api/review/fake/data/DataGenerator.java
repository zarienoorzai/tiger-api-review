package tigers.api.review.fake.data;

import java.util.Date;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;

public class DataGenerator {

	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName() + "@yahoo.com";
	
	}
	
	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
		
	}
	
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
		
	}
	
	public static String getDob() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
		
	}
	
	public static String getStreetAddress() {
		Faker faker = new Faker();
		return faker.address().streetAddress();
		
	}
	
	public static String getCity() {
		Faker faker = new Faker();
		return faker.address().city();
		
	}
	
	public static String getState() {
		Faker faker = new Faker();
		return faker.address().state();
		
	}
	
	public static String getPostalCode() {
		Faker faker = new Faker();
		return faker.address().zipCode();
		
	}
	
	public static String getCountryCode() {
		Faker faker = new Faker();
		return faker.address().countryCode();
		
		}
	
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();
		
	}
	
	public static String getExtension() {
		Faker faker = new Faker();
		return faker.phoneNumber().extension();
		
	}
	
	
}

