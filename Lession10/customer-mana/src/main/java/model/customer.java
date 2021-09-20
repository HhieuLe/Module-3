package model;

public class customer {
    private String name;
    private String dayOfBirth;
    private String address;

    public customer() {
    }

    public customer(String name, String dayOfBirth, String address) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
