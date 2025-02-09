package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getRandomEmail(){

        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0,100) + "@test.com";
        return email;
        
    }

    public static String getRandomName(){

        Faker faker = new Faker();
        String name = faker.name().firstName();
        return name;
        
    }

    public String getRandomName2(){

        Faker faker = new Faker();
        String name = faker.name().firstName();
        return name;
        
    }
    
}
