package repository;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> customers = new ArrayList<>();

    static{
        customers.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fchiemtaimobile.vn%2Ftin-cong-nghe%2Favatar-facebook-dep%2F&psig=AOvVaw1WNJVx151eYORqIBRWEJTa&ust=1754572208615000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMDv7Pyg9o4DFQAAAAAdAAAAABAE"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fchiemtaimobile.vn%2Ftin-cong-nghe%2Favatar-facebook-dep%2F&psig=AOvVaw1WNJVx151eYORqIBRWEJTa&ust=1754572208615000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMDv7Pyg9o4DFQAAAAAdAAAAABAE"));
        customers.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fchiemtaimobile.vn%2Ftin-cong-nghe%2Favatar-facebook-dep%2F&psig=AOvVaw1WNJVx151eYORqIBRWEJTa&ust=1754572208615000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMDv7Pyg9o4DFQAAAAAdAAAAABAE"));
        customers.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fchiemtaimobile.vn%2Ftin-cong-nghe%2Favatar-facebook-dep%2F&psig=AOvVaw1WNJVx151eYORqIBRWEJTa&ust=1754572208615000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMDv7Pyg9o4DFQAAAAAdAAAAABAE"));
        customers.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fchiemtaimobile.vn%2Ftin-cong-nghe%2Favatar-facebook-dep%2F&psig=AOvVaw1WNJVx151eYORqIBRWEJTa&ust=1754572208615000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMDv7Pyg9o4DFQAAAAAdAAAAABAE"));
    }

    @Override
    public List<Customer> getCustomers() {
        return customers;
    }
}
