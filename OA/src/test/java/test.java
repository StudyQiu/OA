import com.oasys.entity.Employee;
import com.oasys.service.EmployeeService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {
    @Test
    public void test(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        EmployeeService employeeServiceImpl = (EmployeeService) context.getBean("EmployeeServiceImpl");
        for (Employee employee : employeeServiceImpl.selectAll()) {
            System.out.println(employeeServiceImpl);
        }
    }
}
